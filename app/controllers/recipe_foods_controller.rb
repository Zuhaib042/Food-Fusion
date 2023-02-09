class RecipeFoodsController < ApplicationController
  before_action :set_recipe
  before_action :set_foods

  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe = @recipe

    if @recipe_food.save
      redirect_to recipe_path(@recipe), notice: 'Recipe_Food has been added successfully'
    else
      flash.now[:error] = 'Recipe_Food could not be saved, try again'
      render :new
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.recipe = @recipe
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe), notice: 'Ingredient has been updated successfully'
    else
      redirect_to recipe_path(@recipe_food.recipe), alert: 'try again.'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_foods
    @foods = Food.all
  end

  # protected params
  def recipe_food_params
    params.required(:recipe_foods).permit(:quantity, :food_id)
  end
end
