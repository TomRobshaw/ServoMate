class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :garage
end
