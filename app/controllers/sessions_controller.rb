class SessionsController < ApplicationController
  before_action :current_user, only: [:new]

  def new
    @user = User.new
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user&.valid_password?(params[:user][:password])
      cookies[:user_id] = user.id
      flash[:success] = "Yay you have logged in"
      redirect_to root_path
    else
      flash[:danger]="Invalid user or password"
      redirect_to new_session_path
    end
  end

  def forgot_password
    render 'forgot_password'
  end

  def reset_password
    user = User.find_by_email(params[:email])
    if user
      temp_password = SecureRandom.hex(6)
      user.update(password: temp_password, password_confirmation: temp_password)
      ForgotPasswordMailer.forgot_password(user).deliver_now
      flash[:info] = "Your new password has been sent to your email."
      redirect_to login_path
    else
      flash[:danger] = "No user found with this email."
      redirect_to login_path
    end
  end

  def logout
    cookies.delete(:user_id)
    redirect_to new_login_path
  end

  private

  def current_user
    @current_user = User.find_by_id(cookies[:user_id])
    redirect_to root_path if @current_user
  end

end
