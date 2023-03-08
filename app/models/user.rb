class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates :password, confirmation: {case_sensitive: true}
  validates :email, presence: true, format: Devise.email_regexp, uniqueness: {:case_sensitive => false}
  validates_uniqueness_of :phone_number
end
