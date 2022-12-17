require 'rails_helper'

RSpec.describe Inventory, type: :model do
  subject do
    @user = User.create!(name: 'Tom', role: "admin", email: "email@hmail.com", password: "password")
    Inventory.create!(name: "Inventory 1", description: "my ringtone", user_id: @user.id)
  end

  it 'should be invalid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should be invalid without name' do
    subject.description = nil
    expect(subject).to be_valid
  end
end
