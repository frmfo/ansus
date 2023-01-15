class CreateUsersBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :users_branches, id: false do |t|
      t.references :user
      t.references :branch

      t.timestamps
    end

    add_index(:users_branches, [ :user_id, :branch_id ])
  end
end
