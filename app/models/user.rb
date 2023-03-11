class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_FORMAT = /\A
  (?=.{8,})          # Must contain 8 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
  (?=.*[A-Z])        # Must contain an upper case character
  (?=.*[[:^alnum:]]) # Must contain a symbol
/x

  validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation
  validates :password,   presence: true, 
  length: { in: Devise.password_length }, 
  format: { with: PASSWORD_FORMAT }, 
  confirmation: true, 
  on: :create, confirmation: {case_sensitive: true}
  validates :email, presence: true, format: Devise.email_regexp, uniqueness: {:case_sensitive => false}
  validates_uniqueness_of :phone_number, allow_nil: true, allow_blank: true
end
