class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :service_histories, dependent: :destroy
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :kilometers, presence: true
  has_one_attached :image

  # def initialize
  #   @car.tyres_expired = 96_000
  #   @car.brakes_expired = 80_000
  #   @car.oil_and_filter_expired = 15_000
  #   @car.spark_plugs_and_ignition_expired = 30_000
  #   @car.tyres = 0
  #   @car.brakes = 0
  #   @car.spark_plugs_and_ignition = 0
  #   @car.oil_and_filter = 0
  # end
end
