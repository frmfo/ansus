class VehicleCostcenter < ApplicationRecord
  belongs_to :vehicle
  belongs_to :costcenter
end
