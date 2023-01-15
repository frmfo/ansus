class Company < ApplicationRecord
  has_many :branches

  validates :name, :brand, presence: true
  validates :name, :brand, uniqueness: true
end
