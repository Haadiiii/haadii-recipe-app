class RecipeController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventories = Inventory.all
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
    redirect_to user_food_path(current_user.id)
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.public_recipe == true
      @recipe.update(public_recipe: false)
    else
      Recipe.find(@recipe.id).update(public_recipe: true)
    end
    redirect_to user_recipe_path(@recipe.id), notice: 'Public Updated'
  end

  def create
    recipe = Recipe.create(recipe_params)
    recipe.user_id = current_user.id
    if recipe.valid?
      recipe.save
      flash[:notice] = "Recipe created successfully"
      redirect_to user_recipe_index_path(id: current_user.id)
    else
      render :new
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    redirect_to user_recipe_index_path(current_user.id)
    if current_user == recipe.user
      recipe.destroy
    else
      flash[:danger] = "Sorry, something went wrong!"
    end
  end

  def public
    @recipes = Recipe.all
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public_recipe)
  end
end
