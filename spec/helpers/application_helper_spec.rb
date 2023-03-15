require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
    before do
        user = create(:user)
        cookies[:user_id]=nil
    end
    it "should return user" do
        expect(current_user).to eq(nil)
    end
end
  