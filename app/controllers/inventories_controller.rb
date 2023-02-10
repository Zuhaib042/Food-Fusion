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
    @inventory = Inventory.new(name: params[:inventory][:name], created_at: '2020/01/01', updated_at: '2020/01/01',
                               user: current_user)
    if @inventory.save
      flash[:notice] = 'Inventory created Successfully.'
      redirect_to inventories_path
    else
      render action: 'new'
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    flash[:notice] = 'Inventory deleted Successfully.'
    redirect_to inventories_path
  end
end
