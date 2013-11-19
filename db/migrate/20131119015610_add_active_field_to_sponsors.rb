class AddActiveFieldToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :active, :boolean, default: false
  end
end
