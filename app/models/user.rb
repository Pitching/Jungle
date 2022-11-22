class User < ApplicationRecord
  
  validates :password, confirmation: true, length: {minimum: 8}
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    @user = User.where("lower(email) = ?", email.strip.downcase).first
    @user && @user.authenticate(password) ? @user : nil
  end

end
