require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  let(:user) {create(:user)}
  
  let(:user_params) {
    {
      user: {
        first_name: "Yash",
        last_name: "Pandey",
        email: "yash1@gmail.com",
        password: "Rails@1234",
        password_confirmation: "Rails@1234"
    }
  }
}

  describe "GET /index" do
    it "should render new user form" do
      get '/registrations/new'
      expect(response).to render_template("new")
    end
  end
  describe "POST /create" do
    it "should registered the new user" do
      post '/signup', params: user_params
      expect(response).to redirect_to(send_otp_path)
    end

    it "should not registered new user" do
      user_params[:user][:email]=nil
      post '/signup', params: user_params
      expect(response).to redirect_to(new_registration_path)
    end
  end

  describe "GET /send_otp" do

    before do
      cookies[:user_id] = user.id
    end

    it "should sent otp to user email" do
      get "/send_otp"
      expect(response).to render_template('send_otp')
    end

    it "should not send the otp to user" do
      user.activated = true
      user.save(validate: false)
      get "/send_otp"
      expect(response).to redirect_to(:root)
    end
  end

  describe "GET /verify_otp" do

    before do
      user.otp_expiration=Time.now - 2.minutes
      user.otp = 5473
      user.save(validate: false)
      @user = user
    end

    it "should verify the otp" do
      post "/verify_otp", params: {email: user.email, otp: user.otp}
      expect(response).to redirect_to(:root)
    end

    it "should not verify the otp" do
      post "/verify_otp", params: {email: user.email}
      expect(response).to redirect_to(:send_otp)
    end

    it "otp should be expired" do
      user.otp_expiration=Time.now - 8.minutes
      user.save(validate: false)
      post "/verify_otp", params: {email: user.email}
      expect(response).to redirect_to(:send_otp)
    end
  end

end
