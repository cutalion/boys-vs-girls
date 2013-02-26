require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "Should_not_save_message_without_user_id" do 
		message = Message.new
		assert !message.save
  end
  
  test "Should_not_save_message_without_text" do 
		message = Message.new
		assert !message.save
	end
end