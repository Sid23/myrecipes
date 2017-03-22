class Recipe < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 30}
  validates :description, presence: true, length: {minimum: 10, maximum: 255}
  validates :chef_id, presence: true
  belongs_to :chef
end
