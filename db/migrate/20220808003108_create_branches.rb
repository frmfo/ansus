class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name, null: false, limit: 30, default: ""
      t.boolean :status, default: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
    add_index :branches, :name, unique: true
  end
end
