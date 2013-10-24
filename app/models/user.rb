class User < ActiveRecord::Base
  validates :email, :presence => true
  validates_uniqueness_of :email
  validates :password_digest, :presence => true
end
