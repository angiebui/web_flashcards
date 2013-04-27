helpers do
  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
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