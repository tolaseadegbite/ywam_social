class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
    add_index :reviews, [:user_id, :reviewable_id, :reviewable_type], unique: true
    add_index :reviews, [:reviewable_id, :reviewable_type]
  end
end
