require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Tom', role: "admin")
  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end
  it 'is not valid without a email' do
    user.role = nil
    expect(user).to_not be_valid
  end
end
