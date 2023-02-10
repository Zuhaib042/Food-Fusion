class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, :cooking_time, :preparation_time, :description, presence: true
end
