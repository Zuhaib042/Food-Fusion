class AddRecipesRefToRecipefoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :recipe, null: false, index: true, foreign_key: true
  end
end
