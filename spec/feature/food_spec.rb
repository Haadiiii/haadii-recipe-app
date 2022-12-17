require 'rails_helper'

RSpec.describe 'food/index.html.erb', type: :feature do
  describe 'Food#index' do
    before(:each) do
      @user = User.create!(name: 'Tom', role: "admin", email: "email@gmail.com", password: "password")
      Food.create!(name: "eggs", measurement_unit: "grams", price: 10, user_id: @user.id)

      visit new_user_session_path
      fill_in 'Email', with: "email@gmail.com"
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit user_food_index_path(user_id: @user.id)
    end

    it 'should display all the food details' do
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
