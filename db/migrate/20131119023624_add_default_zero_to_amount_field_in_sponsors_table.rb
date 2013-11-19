class AddDefaultZeroToAmountFieldInSponsorsTable < ActiveRecord::Migration
  def up
    change_column :sponsors, :amount, :float, :default => 0
  end
  def down
    change_column :sponsors, :amount, :float, :default => nil
  end
end
