require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "Should_not_save_message_without_user_id" do 
		message = Message.new
		message.valid? # => false
		message.errors[:user_id]
 		assert message.errors[:user_id].include? "can't be blank"
  end
  

  test "Should_not_save_message_without_text" do 
		message = Message.new
		message.valid? # => false
		message.errors[:text]
 		assert message.errors[:text].include? "can't be blank"
  end
end