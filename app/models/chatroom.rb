class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :garage
  belongs_to :user
end
