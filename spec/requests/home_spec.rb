require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      user = create(:user)
      cookies[:user_id] = user.id
      get "/"
      expect(response).to render_template('index')
    end
  end

end
