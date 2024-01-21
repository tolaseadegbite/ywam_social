class CreateListingSuitabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :listing_suitabilities do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :suitability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
