class SessionsController < ApplicationController
  skip_before_action :authenticate!

  def new
  end

  def create
    session[:password] = params[:password]
    authenticate!

    redirect_to edit_settings_path
  end
end