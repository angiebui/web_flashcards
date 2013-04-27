get '/' do
  @rounds = Round.order("score DESC")

  erb :index
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:id] = user.id
    erb :decks
  else
    @errors = ["Not a valid email or password"]
    erb :index
  end
end

post '/signup' do
  user = User.new(params)
  if user.save
    session[:id] = user.id
    erb :decks
  else
    @errors = user.errors.full_messages
    erb :index
  end
end

post '/logout' do
  session[:id] = nil 
  redirect '/'
end

