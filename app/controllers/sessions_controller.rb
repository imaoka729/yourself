class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(account_id: params[:session][:account_id])
    if user && user.passward == (params[:session][:password])
      log_in user

      # もしuser.adminがtrueなら
      if user.admin
      #   リダイレクト　user/index
        redirect_to '/users'
      else
      #   リダイレクト　↓
        redirect_to '/menu/index'
      end

    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/login'
  end

end
