class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :tyres, presence: true
  validates :kilometers, presence: true
  validates :oil_and_filter, presence: true
  validates :spark_plugs_and_ignition, presence: true
  validates :brakes, presence: true
end
