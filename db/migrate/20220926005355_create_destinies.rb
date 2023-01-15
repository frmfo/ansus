class CreateDestinies < ActiveRecord::Migration[7.0]
  def change
    create_table :destinies do |t|
      t.string :name, null: false, limit: 60, default: ""
      t.boolean :status, default: true

      t.timestamps
    end
    add_index :destinies, :name, unique: true
  end
end
