class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.references :listing, null: false, foreign_key: true
      t.integer :room_type
      t.integer :number_of_room, default: 1, null: false

      t.timestamps
    end
  end
end
