class InventoryFoodController < ApplicationController
  def index
    @inventory_food = InventoryFood.all
  end

  def show
    @inventory_food = InventoryFood.find(params[:id])
  end

  def new
    @inventory_food = InventoryFood.new
    @inventory = Inventory.find(params[:inventory_id])
  end

  def create
    @inventory_food = InventoryFood.create(inventory_food_params)
    @inventory_food.inventory_id = params[:inventory_id]
    @inventory_food.food_id = params[:food_id]
    @inventory_food.save
    redirect_to user_inventory_path(current_user.id, params[:inventory_id]), notice: 'Inventory Food was successfully created.'
  end

  def destroy
    @inventory_food = InventoryFood.find_by(id: params[:id])

    redirect_to user_inventory_path(current_user.id, params[:inventory_id]), notice: 'Inventory Food was successfully deleted.'

    if @inventory_food.destroy
      flash[:success] = 'Inventory deleted'
    else
      flash.now[:error] = 'Inventory Not Deleted'
    end
  end

  private

  def inventory_food_params
    params.require(:@inventory_food).permit(:quantity, :food_id, :inventory_id)
  end
end
