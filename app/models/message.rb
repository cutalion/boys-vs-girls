class Message < ActiveRecord::Base
  attr_accessible :text, :user_id
  validates :text, :user_id, :presence => true
end
