require 'rails_helper'

RSpec.describe "Registrations", type: :request do
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
      expect(response).to redirect_to(root_path)
    end

    it "should not registered new user" do
      user_params[:user][:email]=nil
      post '/signup', params: user_params
      expect(response).to redirect_to(new_registration_path)
    end
  end

end
