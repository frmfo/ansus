class CreateWeighings < ActiveRecord::Migration[7.0]
  def change
    create_table :weighings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :branch, null: false, foreign_key: true
      t.references :costcenter, null: false, foreign_key: true
      t.integer :destino
      t.references :employee, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.date :dia, null: false
      t.time :hora, null: false
      t.decimal :weight_in, null: false
      t.decimal :weight_out, null: false

      t.timestamps
    end
  end
end
