class Costcenter < ApplicationRecord
  belongs_to :branch
  belongs_to :service
  has_and_belongs_to_many :employees

  has_many :weighings

  has_many :vehicle_costcenters, dependent: :destroy
  has_many :vehicles, through: :vehicle_costcenters

  has_many :employee_costcenters, dependent: :destroy
  has_many :employees, through: :employee_costcenters

  validates :name, presence: true
  validates :name, uniqueness: true
end
