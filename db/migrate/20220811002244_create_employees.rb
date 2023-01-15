class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name, limit: 100, null: false, default: ""
      t.boolean :status, default:true 

      t.timestamps
    end
    add_index :employees, :name, unique: true
  end
end
