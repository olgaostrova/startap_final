class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.string :description
      t.integer :likes
      t.integer :dislikes
      t.integer :taps
      t.integer :author_name
      t.references :user, null: false, foreign_key: true
      t.references :startup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
