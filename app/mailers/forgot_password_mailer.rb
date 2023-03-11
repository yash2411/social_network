class ForgotPasswordMailer < ApplicationMailer
    def forgot_password(user)
        @user = user
        mail(from: "My Network", to: @user.email, subject: "New password") do |format|
            format.html {render inline: "<p>Your new password is <strong> #{@user.password}</strong> </p>"}
        end
    end
end
