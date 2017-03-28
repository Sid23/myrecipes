class RecipeIngredient < ApplicationRecord
  # Each entry of this association table belongs both to an ingredient and a :recipe
  # Just one recipe and ingredient for each record, the combination should be unique
  belongs_to :ingredient 
  belongs_to :recipe
end