require 'spec_helper'

describe User do
  it 'should validate alnum for name' do
    user = User.new
    user.valid?
    user.errors[:name].should be_empty

    user.name = '12333'
    user.valid?
    user.errors[:name].should be_empty

    user.name = 'qqqqqq'
    user.valid?
    user.errors[:name].should be_empty

    user.name = '!())$'
    user.valid?
    user.errors[:name].should_not be_empty

    user.name = 'tr$'
    user.valid?
    user.errors[:name].should_not be_empty
  end
end
