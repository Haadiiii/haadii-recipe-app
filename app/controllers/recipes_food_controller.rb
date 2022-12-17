class RecipesFoodController < ApplicationController
  def index
    @recipes_food = RecipesFood.all
  end

  def show
    @recipes_food = RecipesFood.find(params[:id])
  end

  def new
    @recipe_food = RecipesFood.new
  end

  def create
    @recipe_food = RecipesFood.create(recipes_food_params)
    @recipe_food.recipe_id = params[:recipe_id]
    @recipe_food.food_id = params[:food_id]
    @recipe_food.save
    redirect_to user_recipe_path(current_user.id, params[:recipe_id]), notice: 'Recipe Food was successfully created.'
  end

  def destroy
    @recipe_food = RecipesFood.find_by(id: params[:id])

    redirect_to user_recipe_path(current_user.id, params[:recipe_id]), notice: 'Recipe Food was successfully deleted.'

    if @recipe_food.destroy
      flash[:success] = 'Inventory deleted'
    else
      flash.now[:error] = 'Inventory Not Deleted'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.public_recipe == true
      @recipe.update(public_recipe: false)
    else
      Recipe.find(@recipe.id).update(public_recipe: true)
    end
    redirect_to user_recipe_path(current_user.id, params[:recipe_id]), notice: 'Public Updated'
  end

  private

  def recipes_food_params
    params.require(:@recipes_food).permit(:quantity, :recipe_id, :food_id)
  end
end
