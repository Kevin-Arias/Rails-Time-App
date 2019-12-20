class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { :case_sensitivie => false }
  
  attr_accessor :login_check
  validates :email, :password, presence: true, if: ->{login_check}

  attr_accessor :check_all
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true, if: ->{check_all}

  attr_accessor :edit_check
  validates :first_name, :last_name, presence: true, if: ->{edit_check}
end
