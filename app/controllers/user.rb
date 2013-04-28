get '/user/:id' do
  @user = User.find(params[:id])
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

