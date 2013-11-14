class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.boolean :active, default: true
      t.boolean :featured, default: false
      t.integer :priority, default: 0
      t.string :name
      t.text :description
      t.text :content
      t.datetime :published_at
      t.attachment :photo
      t.belongs_to :user
      t.timestamps
    end
    add_index :posts, :active
    add_index :posts, :featured
    add_index :posts, :priority
    add_index :posts, :published_at
    add_index :posts, :name
    add_index :posts, :user_id
  end
end
