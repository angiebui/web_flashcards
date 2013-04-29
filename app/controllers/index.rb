get '/' do
  if session[:valid]
    @user = User.find(session[:user_id])
    @user_rounds = Round.where("user_id = ?", @user.id)
    @user_stats = @user_rounds.map do |round|
      {
        :deck => Deck.find(round.deck_id).category,
        :score => round.score
      }
    end
  end

  @top_rounds = Round.order("score DESC").limit(5)
  @decks = Deck.all

  @fab_five = @top_rounds.map do |round|
    {
      :player => User.find(round.user_id).name,
      :deck => Deck.find(round.deck_id).category,
      :score => round.score
    }
  end

  erb :index
end

post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:valid] = true
    session[:user_id] = user.id
    session[:user_name] = user.name
    session[:user_email] = user.email
    
    redirect "/"
  else
    @errors = ["Not a valid email or password"]

    session[:valid] = false
    erb :index
  end
end

post '/signup' do
  user = User.new(params)
  if user.save
    session[:valid] = true
    session[:user_id] = user.id
    session[:user_name] = user.name
    session[:user_email] = user.email
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :index
  end
end

get '/logout' do
  session[:valid] = false
  session[:user_id] = nil
  session[:user_name] = nil
  session[:user_email] = nil
  redirect '/'
end

