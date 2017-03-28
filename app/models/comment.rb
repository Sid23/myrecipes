class Comment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 4, maximum: 140 }
  validates :chef_id, presence: true
  validates :recipe_id, presence: true
  # set the default order: 1st displayed is the last updated
  default_scope -> { order(updated_at: :desc)}
  # Following lines define the association
  belongs_to :chef
  belongs_to :recipe 
end
