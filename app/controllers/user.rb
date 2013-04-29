get '/user/:id' do
  @user = User.find(params[:id])
  @rounds = Round.where("user_id = ?", params[:id]).limit(10).order("id DESC")
  @games = @rounds.map {|round| Deck.find_by_id(round.deck_id).category}

  erb :profile
end

get '/home' do
  if logged_in? 
    erb :decks
  else
    @errors = ["You must login or signup to enter"]
    erb :index
  end
end

