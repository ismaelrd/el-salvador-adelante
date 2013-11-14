class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.boolean :active, default: true
      t.boolean :featured, default: false
      t.string :name
      t.text :description
      t.text :content
      t.datetime :published_at
      t.attachment :photo
      t.belongs_to :user
      t.timestamps
    end
    add_index :articles, :active
    add_index :articles, :featured
    add_index :articles, :published_at
    add_index :articles, :name
    add_index :articles, :user_id
  end
end
