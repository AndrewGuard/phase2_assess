class User < ActiveRecord::Base
  validates :email, presence: true

  has_secure_password

  validates :email, :uniqueness => true, :format => /.+@.+\..+/
  validates :password_digest, presence: true

  has_many :events
  has_many :created_events, through: :events
  has_many :attended_events, through: :events

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
     # either invalid email or wrong password
  end
end
