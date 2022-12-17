require 'rails_helper'

RSpec.describe RecipesFood, type: :model do
  subject do
    @user = User.create!(name: 'Tom', role: "admin", email: "email@hmail.com", password: "password")
    @food = Food.create!(name: "eggs", measurement_unit: "grams", price: 10, user_id: @user.id)
    @recipe = Recipe.create!(name: 'recipe 1', preparation_time: '5 hours', cooking_time: '20 min', description: 'ddajdhasjdhdjdhsadhadhjkahdkahd', user_id: @user.id)

    RecipesFood.create!(quantity: 20, food_id: @food.id, recipe_id: @recipe.id)
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end
end
