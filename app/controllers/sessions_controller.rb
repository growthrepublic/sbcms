class SessionsController < ApplicationController
  def new
  end

  def create
    session[:password] = params[:password]
    authenticate!

    redirect_to edit_settings_path
  end
end