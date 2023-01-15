class EmployeeCostcenter < ApplicationRecord
  belongs_to :employee
  belongs_to :costcenter
end
