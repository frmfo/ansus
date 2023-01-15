class Vehicle < ApplicationRecord
  has_many :vehicle_costcenters, dependent: :destroy
  has_many :costcenters, through: :vehicle_costcenters

  has_many :weighing

  validates :name, :brand, :plate, presence: true
  validates :name, :plate, uniqueness: true
end
