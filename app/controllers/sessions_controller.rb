class SessionsController < ApplicationController

  def create
    sign_up_with params[:session][:email]
    redirect_to todos_path
  end

end