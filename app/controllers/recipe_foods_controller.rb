class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  before_action :set_foods, except: [:new, :edit]

  def new
    @recipe_food = RecipeFood.new
    @foods = current_user.foods.all
  end

  def create
    @recipe_food = RecipeFood.new(quantity: params[:quantity], food_id: params[:food_id])
    @recipe_food.recipe = @recipe
    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingredient has been added successfully'
    else
      redirect_to recipe_path(@recipe), alert: 'try again.'
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(quantity: params[:quantity], food_id: params[:food_id])
      redirect_to recipe_path(@recipe), notice: 'Ingredient has been updated successfully'
    else
      redirect_to recipe_path(@recipe), alert: 'try again.'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe), notice: 'Ingredient has been deleted successfully'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_foods
    @foods = Food.all
  end

end
