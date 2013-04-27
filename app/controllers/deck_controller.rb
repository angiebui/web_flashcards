get '/deck/:id' do
  session[:current_game] = Round.create(:user_id => session[:id], :deck_id => params[:id])
  @deck = Deck.find(params[:id]).cards

  @card = Card.find_by_deck_id(params[:id])
  session[:current_card] = @card.id

  erb :show_cards
end

post '/deck/check' do
  if params[:answer] == current_card.answer
    current_game.increment_score!
    @message = "Correct!"
  else
    @message = "Incorrect. Answer is #{current_card.answer}"
  end
    session[:current_card] = current_card.id + 1
    erb :show_cards
end


get '/deck/card/:id' do
  erb :show_cards
end