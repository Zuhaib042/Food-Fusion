class ShoppingListController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])
    @missing_foods = []
    
    @recipe.foods.each do |food|
     unless @inventory.foods.include?(food)
       @missing_foods.push(food)
     end
    end

  end
  

end