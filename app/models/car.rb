class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
end
