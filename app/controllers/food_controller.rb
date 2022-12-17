class FoodController < ApplicationController
  def index
    @food = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(
      name: food_params[:name],
      measurement_unit: food_params[:measurement_unit],
      price: food_params[:price],
      user_id: current_user.id
    )

    if @food.save
      redirect_to user_food_index_path(current_user.id)
    else
      render :new, alert: ':( Cannot Create food retry again :('
    end
  end

  def destroy
    @food = Food.find(params[:id])

    redirect_to user_food_index_path(current_user.id)
    if @food.destroy
      flash[:success] = 'Food deleted'
    else
      flash.now[:error] = 'Food Not Deleted'
    end
  end

  def shopping
    @foods = Food.all
    @inventory_foods = InventoryFood.all
    @recipes_foods = RecipesFood.all
  end

  def list
    @shopping = Inventory.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
