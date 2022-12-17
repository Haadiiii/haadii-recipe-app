class InventoryController < ApplicationController
  def index
    @inventory = Inventory.all
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new(
      name: inventory_params[:name],
      description: inventory_params[:description],
      user_id: current_user.id
    )
    if @inventory.save
      redirect_to user_inventory_index_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @inventory = Inventory.find_by(id: params[:id])

    redirect_to user_inventory_index_path(current_user.id)

    if @inventory.destroy
      flash[:success] = 'Inventory deleted'
    else
      flash.now[:error] = 'Inventory Not Deleted'
    end
  end

  def shopping
    @foods = Food.all
  end

  private

  def inventory_params
    params.permit(:name, :description)
  end
end
