class CreateListingFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_facilities do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end
  end
end
