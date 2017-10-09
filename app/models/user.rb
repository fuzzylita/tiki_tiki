class User < ActiveRecord::Base
  has_many :drinks
  has_secure_password

  include TextManipulator::InstanceMethods
  extend TextManipulator::ClassMethods
end
