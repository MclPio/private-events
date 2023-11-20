class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :events, inverse_of: 'creator', dependent: :destroy

  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
end
