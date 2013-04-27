helpers do
  def current_user
    if session[:id]
      @current_user ||= User.find_by_id(session[:id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end
end