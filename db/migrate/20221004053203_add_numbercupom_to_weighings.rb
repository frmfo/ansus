class AddNumbercupomToWeighings < ActiveRecord::Migration[7.0]
  def change
    add_column :weighings, :numbercupom, :string
  end
end
