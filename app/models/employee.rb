class Employee < ApplicationRecord
  has_many :employee_costcenters, dependent: :destroy
  has_many :costcenters, through: :employee_costcenters
  
  has_many :weighings

  validates :name, presence: true
  validates :name, uniqueness: true
end
