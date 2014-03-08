class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash[:success] = "Welcome #{user.name}"
      redirect_to dashboard_root_path
    else
      flash[:success] = "Bad Credentials"
      render '/pages/home'
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Signed Out"
  end
end