helpers do
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def current_game
    if session[:current_game]
      @current_game ||= Round.find(session[:current_game])
    end
  end
end


