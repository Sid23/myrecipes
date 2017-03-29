class Like < ApplicationRecord
  belongs_to :chef
  belongs_to :recipe
  
  # Validate the uniqueness of the couple chef, :recipe
  # A chef cannot put more like for the same recipe
  validates_uniqueness_of :chef, scope: :recipe
end