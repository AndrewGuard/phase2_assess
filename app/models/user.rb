class User < ActiveRecord::Base

  require 'bcrypt'

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :birthdate, presence: true

  validates :email, :uniqueness => true, :format => /.+@.+\..+/

  has_many :created_events, class_name: "Event", foreign_key: "creator_id"
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, source: :event

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
     # either invalid email or wrong password
   end
 end
