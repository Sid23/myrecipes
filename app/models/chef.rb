class Chef < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :chefname, presence: true, length: { minimum: 3, maximum: 30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_many :recipes, dependent: :destroy
  has_secure_password
  # set the default order: 1st displayed is the last updated
  default_scope -> { order(updated_at: :desc)}
  # Allow nil set to true is needed when we want to update the profile, but password remains the same as before
  # allow_nil has no effect during sign up when has secure paswors is set
  # difference between sql instructions: "Insert into" and "update"
  validates :password, presence:true, length: { minimum: 5}, allow_nil: true
  # Association with comments, if chef is deleted, its comment are deleted as well
  has_many :comments, dependent: :destroy
  # keep track of like/dislike
  has_many :likes, dependent: :destroy
end