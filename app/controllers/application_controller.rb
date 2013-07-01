require 'ostruct'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_up_with( email)
    session[:current_email] = email
  end

  def current_user
    if current_email
      User.new(current_email)
    else
      Guest.new
    end
  end
  helper_method :current_user

  private
  def current_email
    session[:current_email]
  end
end
