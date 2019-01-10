class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! 


  #helper_method :current_user, :logged_in?



  #def set_current_user
  #  @current_user = User.find_by(id: session[:user_id])
  #end

  #private

  #def current_user
  #  return unless session[:user_id]
  #  @current_user ||= User.find(session[:user_id])
  #end

  #def logged_in?
  #  !!session[:user_id]
  #end

  #def authenticate
  #  return if logged_in?
  #  redirect_to root_path, alert: "ログインしてください"
  #end
end