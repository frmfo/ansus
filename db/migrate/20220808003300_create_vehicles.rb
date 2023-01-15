class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.integer :fleet
      t.string :name, limit: 30, null: false, default: ""
      t.string :brand, limit: 30, null: false, default: ""
      t.string :plate, limit: 8, null: false, default: ""
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :vehicles, :name, unique: true
    add_index :vehicles, :plate, unique: true
  end
end
