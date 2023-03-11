class AddOtpOtpExpirationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp, :integer
    add_column :users, :otp_expiration, :datetime
  end
end
