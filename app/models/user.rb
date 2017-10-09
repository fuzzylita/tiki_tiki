class User < ActiveRecord::Base
  has_many :drinks
  has_secure_password
end
