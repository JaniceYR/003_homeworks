class User < ApplicationRecord
  attr_reader :password

  before_validation :ensure_session_token
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if BCrypt::Password.new(user.password_digest).is_password?(password)
  end

  def self.generate_session_token

  end

  def reset_session_token!
    self.destroy
  end

  def ensure_session_token
    BCrypt::Password.new(@password).is_password?
  end

  def password=(input_pw)

    @password = input_pw
    self.password_digest = BCrypt::Password.create(@password)
  end

end
