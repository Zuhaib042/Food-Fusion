class RecipesController < ApplicationController
  load_and_authorize_resource
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
    @user
    @recipe = Recipe.new(**recipe_params, user_id: current_user.id)

    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe has been added successfully'
    else
      flash.now[:error] = 'Recipe could not be saved, try again'
      render :new
    end
  end

  def destroy
    @recipes = Recipe.all
    @recipe = @recipes.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Post was successfully destroyed.'
    else
      flash.now[:error] = 'Error: Post could not be deleted'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description)
  end
end
