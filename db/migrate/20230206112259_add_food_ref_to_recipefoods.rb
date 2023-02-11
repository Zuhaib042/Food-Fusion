# frozen_string_literal: true

class AddFoodRefToRecipefoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :food, null: false, index: true, foreign_key: true
  end
end
