class Service < ApplicationRecord
  has_many :costcenters
  has_many :weighings

  validates :name, presence: true
  validates :name, uniqueness: true
end
