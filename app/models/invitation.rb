class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id , scope: :event_id

end
