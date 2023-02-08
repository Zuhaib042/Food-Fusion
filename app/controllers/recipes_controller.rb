class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = current_user.recipes.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(**recipe_params, user_id: current_user.id)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe has been added successfully'
    else
      flash.now[:error] = 'Recipe could not be saved, try again'
      render :new
    end
  end

  def destroy
    
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end