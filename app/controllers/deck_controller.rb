require 'json'

get '/deck/:id' do
  @deck = Deck.find(params[:id]).cards
  round = Round.create(:user_id => session[:id], :deck_id => params[:id])
  session[:current_game] = round.id

  erb :show_cards
end

post '/deck/check' do
  @round = Round.find(current_game)
  params.each do |k, v| 
    if Card.find(k.to_i).answer.strip.downcase == v.downcase
    	@round.increment_score!
    	@check = true
    else
    	@check = false
    end
  end

  result = {:score => @round.score, :check => @check}
  
  result.to_json
end
