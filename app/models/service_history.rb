class ServiceHistory < ApplicationRecord
  belongs_to :booking
  validates :date, presence: true
end
