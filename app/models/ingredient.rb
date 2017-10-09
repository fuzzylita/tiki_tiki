class Ingredient < ActiveRecord::Base
  has_many :drink_ingredients
  has_many :drinks, through: :drink_ingredients

  include TextManipulator::InstanceMethods
  extend TextManipulator::ClassMethods
end
