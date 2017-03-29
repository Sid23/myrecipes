class Recipe < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 30}
  validates :description, presence: true, length: {minimum: 10, maximum: 255}
  validates :chef_id, presence: true
  # set the default order: 1st displayed is the last updated
  default_scope -> { order(updated_at: :desc)}
  belongs_to :chef
  # Following 2 lines are needed to create the association between Recipes and Ingredients
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # Association with comments, if recipe is deleted, its comment are deleted as well
  has_many :comments, dependent: :destroy
  # keep track of like/dislike
  has_many :likes, dependent: :destroy

  # Functions to compute number of like/dislike
  def thumbs_up_total
    self.likes.where(like: true).size
  end

  def thumbs_down_total
    self.likes.where(like: false).size    
  end
end
