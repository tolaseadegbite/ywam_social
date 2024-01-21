class CreateFacilities < ActiveRecord::Migration[7.0]
  def change
    create_table :facilities do |t|
      t.string :name

      t.timestamps
    end
    add_index :facilities, :name, unique: true
  end
end
