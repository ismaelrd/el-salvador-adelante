class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.boolean :active, default: true
      t.belongs_to :assetable, polymorphic: true
      t.string :type
      t.string :name
      t.text :description
      t.text :data
      t.attachment :attachment
      t.integer :priority, default: 0
      t.timestamps
    end
    add_index :assets, :active
    add_index :assets, [:assetable_id, :assetable_type]
    add_index :assets, :type
    add_index :assets, :priority
  end
end
