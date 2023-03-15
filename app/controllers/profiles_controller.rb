class ProfilesController < ApplicationController
    def edit_user_profile
        @user = User.find_by_id(params[:format])
        render 'edit_user_profile'
    end

    def update_user_profile
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
            flash[:success] = "You have updated your profile successfully."
            redirect_to root_path
        else
            flash[:danger] = @user.errors.full_messages.first
            redirect_to edit_user_profile_path(@user)
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :phone_number, :city, :password, :password_confirmation, :avatar)
    end
end
