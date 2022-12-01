class ServiceHistory < ApplicationRecord
  belongs_to :booking
  belongs_to :car
  validates :service_date, presence: true
end
