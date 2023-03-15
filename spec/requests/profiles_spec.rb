require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user) {create(:user)}

  let(:user_params) {
    {
      id: user.id,
      user: {
        first_name: "Yash",
        last_name: "Pandey",
        email: "yash1@gmail.com",
        password: "Rails@1234",
        password_confirmation: "Rails@1234",
        avatar: fixture_file_upload(Rails.root.join('spec', 'fixtures', 'images', 'sample.png'), 'image/png')
    }
  }
}
  describe "GET /index" do
    it "should render edit user form" do
      get '/edit_profile', params: {format: user.id}
      expect(response).to render_template('edit_user_profile')
    end
  end
  
  describe "PUT /update user profile" do
    it "should update user profile" do
      put '/update_profile', params: user_params
      expect(response).to redirect_to(:root)
    end

    it "should not update user profile" do
      user_params[:user][:password]=nil
      user_params[:user][:password_confirmation]=nil
      put '/update_profile', params: user_params
      expect(response).to redirect_to(edit_user_profile_path(user))
    end
  end
end
