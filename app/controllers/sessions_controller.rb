class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(account_id: params[:session][:account_id])
    if user && user.passward = (params[:session][:password])
      log_in user
      redirect_to '/menu/index'
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
