# frozen_string_literal: true

class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe
end
