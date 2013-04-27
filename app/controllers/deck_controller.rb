get '/deck/:id' do
  @deck = Deck.find(params[:id]).cards
    round = Round.create(:user_id => session[:id], :deck_id => params[:id])
    session[:current_game] = round.id
    erb :show_cards
  end

post '/deck/check' do
  @round = Round.find(current_game)
  params.each { |k, v| @round.increment_score! if Card.find(k.to_i).answer.downcase == v.downcase}
  
  erb :answer
end
