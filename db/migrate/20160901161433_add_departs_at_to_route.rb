class AddDepartsAtToRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :departs_at, :datetime
  end
end
