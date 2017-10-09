class Helpers
  def self.existing_user?(email)
    !User.find_by(email: email).nil?
  end

  def self.current_user(session)
      @user = User.find_by(id: session[:id])
      @user
  end

  def self.is_logged_in?(session)
    !User.find_by(id: session[:id]).nil?
  end
end