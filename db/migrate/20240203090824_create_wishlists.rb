class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :wishable, polymorphic: true, null: false

      t.timestamps
    end

    add_index :wishlists, [:user_id, :wishable_id], unique: true
    add_index :wishlists, [:user_id, :wishable_id, :wishable_type], unique: true
  end
end
