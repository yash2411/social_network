require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  subject {create(:user)}
  let(:user_params) {
    {
    "user": {
        "email": subject.email,
        "password": subject.password
    }
  }
}
  describe "GET /new" do
    it "should render the new login form" do
      get "/sessions/new"
      expect(response).to render_template(:new)
    end
  end

  describe "Post /create" do
    it "should login the user" do
      post "/login", params: user_params
      expect(response).to redirect_to(:root)
    end

    it "should not login the user" do
      user_params[:user][:password] = "Wrong"
      post "/login", params: user_params
      expect(response).to redirect_to(:new_session)
    end
  end

  describe "Logout" do
    it "should logout the user" do
      user = create(:user)
      cookies[:user_id] = user.id 
      delete "/logout"
      expect(response).to redirect_to(:new_login)
    end
  end

  describe "GET /forgot_password" do
    it "should render forgot password form" do
      get "/forgot_password" do
      expect(response).to render_template('forgot_password')
      end
    end
  end

  describe "POST /reset_password" do
    it "should reset password" do
      post "/reset_password", params: {email: subject.email}
      expect(response).to redirect_to(:login)
    end

    it "should not reset password" do
      post "/reset_password"
      expect(response).to redirect_to(:login)
    end
  end

end
