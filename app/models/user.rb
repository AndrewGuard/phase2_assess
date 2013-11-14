class User < ActiveRecord::Base

  require 'bcrypt'

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :birthdate, presence: true

  validates :email, :uniqueness => true, :format => /.+@.+\..+/

  has_many :events
  has_many :created_events, through: :events
  has_many :attended_events, through: :events

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
     # either invalid email or wrong password
   end
 end
