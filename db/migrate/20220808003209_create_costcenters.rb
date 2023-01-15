class CreateCostcenters < ActiveRecord::Migration[7.0]
  def change
    create_table :costcenters do |t|
      t.string :name, null: false, limit: 60, default: ""
      t.boolean :status, default: true
      t.references :branch, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
    add_index :costcenters, :name, unique: true
  end
end
