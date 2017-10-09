class User < ActiveRecord::Base
  has_many :drinks
  has_secure_password

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
end
