class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mod, :boolean
  end
end
