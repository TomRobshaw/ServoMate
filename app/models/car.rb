class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :service_histories, dependent: :destroy
  validates :make, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :kilometers, presence: true
  has_one_attached :image
end
