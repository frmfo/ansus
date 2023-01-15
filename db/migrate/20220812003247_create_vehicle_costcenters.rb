class CreateVehicleCostcenters < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicle_costcenters, id: false do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.references :costcenter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
