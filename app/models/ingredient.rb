class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
  # Has many record in the association tables, an ingredient can be used by different recipes
  has_many :recipe_ingredients
  # :through indicates which is the relations table that contains multiple entries of ingr.
  has_many :recipes, through: :recipe_ingredients
end