class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :attendancy
  has_many :attendees, through: :attendancy, source: :users

  validates :title, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true, comparison: { greater_than: :date_start}
end
