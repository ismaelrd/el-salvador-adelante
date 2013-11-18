class AddContentAndPhotoToCategoriesTable < ActiveRecord::Migration
  def change
    add_attachment :categories, :photo
    add_column :categories, :content, :text
  end
end
