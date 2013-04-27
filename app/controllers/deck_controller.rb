get '/game/:id' do
  @current_game = Round.new
  @current_game.user_id = session[:id] 
  @current_game.deck_id = (params[:id])
  @deck = cards.find_by_deck_id(@current_game.deck_id)
  #redirect "/game/card/#{@cards.first}"
  show_cards :erb
end

get '/game/check_answer/' do
  Round.correct if user_answer(params[:answer]) == current_card.answer
  
  redirect '/game/card/:id' 
end


get '/game/card/:id' do
  show_cards :erb
end