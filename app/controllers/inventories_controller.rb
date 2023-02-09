class InventoriesController < ApplicationController
  def index
    @inventories = current_user.inventories.all
  end

  def new
    @inventory = Inventory.new
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def create
    @inventory = Inventory.new(params[:inventory])
    if @inventory.save
      flash[:notice] = 'Successfully created inventory.'
      redirect_to inventories_path
    else
      render action: 'new'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = 'Successfully destroyed inventory.'
    redirect_to inventories_path
  end
end
