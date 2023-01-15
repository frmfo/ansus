class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit: 100, default: ""
      t.string :brand, null: false, limit: 60, default: ""
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :companies, :name, unique: true
    add_index :companies, :brand, unique: true
  end
end
