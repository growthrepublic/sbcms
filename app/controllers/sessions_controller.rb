class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new
  end

  def create
    if Settings.authenticate(params[:password])
      session[:password] = params[:password]
      redirect_to root_path and return
    end

    render :new
  end
end