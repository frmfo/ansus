class Branch < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_branches
  belongs_to :company
  has_many :costcenters
  has_many :weighings
  has_many :destinies

  validates :name, presence: true
  validates :name, uniqueness: true
end
