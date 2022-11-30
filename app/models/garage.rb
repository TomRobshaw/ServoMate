class Garage < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :chatrooms
  validates :name, presence: true
  validates :address, presence: true
end
