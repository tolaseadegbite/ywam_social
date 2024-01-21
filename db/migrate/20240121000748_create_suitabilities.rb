class CreateSuitabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :suitabilities do |t|
      t.string :name

      t.timestamps
    end
    add_index :suitabilities, :name, unique: true
  end
end
