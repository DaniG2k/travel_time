class AddStartAddressAndEndAddressToPaths < ActiveRecord::Migration[5.0]
  def change
    remove_column :paths, :startcoords
    remove_column :paths, :endcoords
    add_column :paths, :start_address, :string
    add_column :paths, :end_address, :string
  end
end
