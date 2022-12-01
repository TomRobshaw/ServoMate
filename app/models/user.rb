class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cars, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
