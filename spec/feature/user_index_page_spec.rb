require 'rails_helper'

RSpec.describe 'Users Index page', type: :feature do
  describe 'User Index Page' do
    before(:each) do
      @user2 = User.create!(name: 'Tom', role: "admin", email: "email@gmail.com", password: "password")
      visit root_path
    end

    scenario 'I can see the username of all other users' do
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end

    scenario 'I can see the number of posts each user has written' do
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end
end
