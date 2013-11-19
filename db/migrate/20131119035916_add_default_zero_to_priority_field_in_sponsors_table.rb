class AddDefaultZeroToPriorityFieldInSponsorsTable < ActiveRecord::Migration
  def up
    change_column :sponsors, :priority, :integer, :default => 0
  end
  def down
    change_column :sponsors, :priority, :integer, :default => nil
  end
end
