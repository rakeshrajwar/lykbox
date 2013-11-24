class Update < ActiveRecord::Base
  attr_accessible :sender_id, :text
  validates_presence_of :text
end
