class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :ancestry
      t.integer :ancestry_depth, default: 0
      t.boolean :active, default: true
      t.integer :priority, default: 0
      t.string :kind, default: 'page'
      t.string :name
      t.text :description
      t.text :content
      t.boolean :in_menu, default: false
      t.timestamps
    end
    add_index :pages, :ancestry
    add_index :pages, :active
    add_index :pages, :priority
    add_index :pages, :in_menu
  end
end
