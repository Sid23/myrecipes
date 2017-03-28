class RecipeIngredient < ApplicationRecord
  # Each entry of this association table belongs both to an ingredient and a :recipe
  # Just one recipe and ingredient for each record, the combination should be unique
  belongs_to :ingredient 
  belongs_to :recipe
  # Following line, is needed to avoit to have repetition of the same ingredient in the same recipe
  # ingredient should appear just once in the same recipe
  validates_uniqueness_of :ingredient, scope: :recipe
end