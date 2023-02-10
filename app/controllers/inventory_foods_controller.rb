class InventoryFoodsController < ApplicationController
  def index
    @inventoryFood = InventoryFood.all
  end

  def create
    @foods = Food.all
    @inventoryfood = InventoryFood.create(inventory_food_params)
    @inventoryfood.inventory = Inventory.find(params[:Inventory_id])
    if @inventoryfood.save
      redirect_to inventory_url(@inventoryfood.inventory), notice: 'InventoryFood Successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @inventoryfood = InventoryFood.new
    @foods = Food.all
  end

  def destroy
    food = InventoryFood.find(params[:id])
    food.destroy
    redirect_to inventory_inventory_food_path
  end

  private

  def inventory_food_params
    params.require(:inventory_foods).permit(:quantity, food_id)
  end
end
