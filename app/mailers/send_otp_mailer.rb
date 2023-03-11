class SendOtpMailer < ApplicationMailer
    def send_otp(user)
        @user = user
        @user.otp = rand(10 ** 4)
        @user.otp_expiration = Time.now
        @user.save(validate: false)
        mail(from: "My Network", to: user.email, subject: "Verify Email", template: 'send_otp_mailer')
    end
end
