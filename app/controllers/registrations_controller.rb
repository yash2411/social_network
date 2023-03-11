class RegistrationsController < ApplicationController
  protect_from_forgery
  before_action :current_user, only: [:new]
  def new
    @user = User.new
  end

  def signup
    user = User.new(user_params)
    if user.save
      user.otp = rand(10 ** 4)
      user.otp_expiration = Time.now
      user.save(validate: false)
      cookies[:user_id] = user.id
      redirect_to send_otp_path
    else
      flash[:danger]=user.errors.full_messages.first
      redirect_to new_registration_path
    end
  end

  def send_otp
    @current_user = User.find_by_id(cookies[:user_id])
    unless @current_user.activated?
      SendOtpMailer.send_otp(@current_user).deliver_now
      flash[:success] = "We have sent an otp to your email."
      render 'send_otp'
    else
      redirect_to root_path
    end
  end

  def verify_otp
    user=User.find_by_email(params[:email])
    if (Time.now - user.otp_expiration) < 5.minutes
      if params[:otp].to_i == user.otp
          user.activated = true
          user.save(validate: false)
        flash[:success] = "Congrats! your account is verified successfully."
        redirect_to root_path
      else
        flash[:danger] = "Invalid OTP"
        redirect_to send_otp_path
      end
    else
      flash[:danger] = "OTP has been expired. We have sent you a new OTP"
      redirect_to send_otp_path
    end
  end

  def current_user
    @current_user = User.find_by_id(cookies[:user_id])
    redirect_to root_path if @current_user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :city)
  end
end
