class Drink < ActiveRecord::Base
  belongs_to :user
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients
end
