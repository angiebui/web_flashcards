require 'json'

get '/deck/:id' do
    @deck = Deck.find(params[:id]).cards
    session[:game_length] = @deck.length
    round = Round.create(:user_id => session[:user_id], :deck_id => params[:id])
    session[:current_game] = round.id
    
    erb :show_cards
end

post '/deck/check' do
  @round = Round.find(session[:current_game])
  params.each do |k, v|
    if Card.find(k.to_i).answer.strip.downcase == v.downcase
    	@round.increment_score!
    	@check = "Correct!!"
    else
    	@check = "Incorrect.."
    end
  end

  @round.save
  result = {:score => @round.score, :check => @check}
  result.to_json
end

post '/percent-score' do
  @round = Round.find(current_game)
  @round.score = params[:score].to_f.round(2) 
  @round.save
end
