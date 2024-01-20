class AddAttributesToListing < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :furniture, :integer, default: 0
    add_column :listings, :size, :integer
  end
end
