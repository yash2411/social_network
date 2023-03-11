require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe "should conain the helper" do
    before do
      @user = create(:user)
      cookies[:user_id] = @user.id
    end
  
    it 'checks if a user is logged in' do
      expect(logged_in?).to eq true
    end

    it 'checks current user presence' do
      expect(current_user).to eq @user
    end
  end
end
