class Message < ActiveRecord::Base
  belongs_to :user
  attr_accessible :text, :user_id
  validates :text, :user_id, :presence => true

  scope :latest,  ->(n) { reverse.limit(n) }
  scope :reverse, -> { order('created_at DESC') }
end
