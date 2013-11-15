class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :kind, default: :anonymous
      t.string :alias
      t.string :name
      t.string :document_type
      t.string :document
      t.float :amount
      t.integer :priority
      t.timestamps
    end
    add_index :sponsors, :kind
  end
end
