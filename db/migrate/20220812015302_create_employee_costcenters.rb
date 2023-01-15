class CreateEmployeeCostcenters < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_costcenters, id: false do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :costcenter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
