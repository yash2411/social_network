class RegistrationsController < ApplicationController
  before_action :current_user, only: [:new]
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:danger]=user.errors.full_messages.first
      redirect_to new_registration_path
    end
  end

  def current_user
    @current_user = User.find_by_id(session[:user_id])
    redirect_to root_path if @current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :city)
  end
end
