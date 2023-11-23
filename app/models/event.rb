class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :invitations, dependent: :destroy
  has_many :invited_users, through: :invitations, source: :user
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user

  validates :title, presence: true, length: { maximum: 60 }
  validates :location, presence: true, length: { maximum: 60 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :date_start, presence: true
  validates :date_end, presence: true, comparison: { greater_than: :date_start }

  scope :past, -> {where(date_start: ..(Time.now))}

  scope :future, -> {where(date_start: (Time.now)..)}
end
