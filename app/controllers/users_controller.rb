class UsersController < ApplicationController
  
  def create
    if session[:session_cookie]
      @user = User.find_by_session_cookie(session[:session_cookie])
    else
      @user = User.new
      @user.session_cookie = SecureRandom.base64(10)
      @user.save
      session[:session_cookie] = @user.session_cookie
    end
  end
end
