class CreateLiabilities < ActiveRecord::Migration
  def change
    create_table :liabilities do |t|
      t.boolean :active, default: true
      t.integer :priority, default: 0
      t.belongs_to :category
      t.string :name
      t.text :description
      t.text :content
      t.attachment :photo
      t.timestamps
    end
    add_index :liabilities, :active
    add_index :liabilities, :priority
    add_index :liabilities, :category_id
  end
end
