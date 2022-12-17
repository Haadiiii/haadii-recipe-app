require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  subject do
    @user = User.create!(name: 'Tom', role: "admin", email: "email@hmail.com", password: "password")
    @food = Food.create!(name: "eggs", measurement_unit: "grams", price: 10, user_id: @user.id)
    @inven = Inventory.create!(name: "Inventory 1", description: "my ringtone", user_id: @user.id)
    InventoryFood.create!(quantity: "20 grams", food_id: @food.id, inventory_id: @inven.id)
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
