class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :garage
  has_many :service_histories
end
