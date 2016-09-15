class AddDepartsAtToPath < ActiveRecord::Migration[5.0]
  def change
    add_column :paths, :departs_at, :datetime
  end
end
