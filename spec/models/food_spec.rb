require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  subject do
    @user = User.create!(name: 'Tom', role: "admin", email: "email@hmail.com", password: "password")
    Food.create!(name: "eggs", measurement_unit: "grams", price: 10, user_id: @user.id)
  end

  before(:each) { subject.save }

  it 'should be invalid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid without name' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
end
