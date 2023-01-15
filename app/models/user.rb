class User < ApplicationRecord
  rolify
  has_and_belongs_to_many :branches, :join_table => :users_branches
  has_many :weighings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

end
