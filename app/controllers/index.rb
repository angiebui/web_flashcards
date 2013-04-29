get '/' do
  @rounds = Round.order("score DESC").limit(5)
  @decks = Deck.all
  erb :index
end

post '/login' do
  @rounds = Round.order("score DESC").limit(5)
  @decks = Deck.all
 user = User.authenticate(params[:email], params[:password])
 if user
  session[:id] = user.id
  erb :index
else
  @errors = ["Not a valid email or password"]
  erb :index
end
end

post '/signup' do
  @rounds = Round.order("score DESC").limit(5)
  @decks = Deck.all
  user = User.new(params)
  if user.save
    session[:id] = user.id
    erb :index
  else
    @errors = user.errors.full_messages
    erb :index
  end
end

post '/logout' do
  session[:id] = nil 
  redirect '/'
end

