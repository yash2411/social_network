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

end
