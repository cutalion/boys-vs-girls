require 'spec_helper'

describe Message do
  it "should validate presence of user id" do
    message = Message.new
    message.valid? # => false
    message.errors[:user_id]
    message.errors[:user_id].should include "can't be blank"
  end

  it "should validate presence of text" do
    message = Message.new
    message.valid? # => false
    message.errors[:text]
    message.errors[:text].should include "can't be blank"
  end
end
