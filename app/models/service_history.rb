class ServiceHistory < ApplicationRecord
  belongs_to :booking
  belongs_to :car
  validates :service_date, presence: true
  has_one_attached :image
end
