class InventoryFoodsController < ApplicationController
 
  def new
    @id = Inventory.find(params[:inventory_id]).id
    @foods = current_user.foods.all
  end

  def create
    @foods = Food.all
    @inventory = Inventory.find(params[:inventory_id])
    @inventory_food = InventoryFood.new(quantity: params[:quantity], food_id: params[:food_id])
    @inventory_food.inventory = @inventory
    if @inventory_food.save
      redirect_to inventory_path(@inventory), notice: 'InventoryFood Successfully created'
    else
      redirect_to inventory_path(@inventory), alert: 'try again.'
    end
  end

  def destroy
    @food = InventoryFood.find(params[:id])
    @food.destroy
    redirect_to inventory_inventory_food_path
  end

  # private

  # def inventory_food_params
  #   params.require(:inventory_foods).permit(:quantity, food_id)
  # end
end
