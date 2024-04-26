class RemoveNumberOfRoomFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :number_of_room, :integer
  end
end
