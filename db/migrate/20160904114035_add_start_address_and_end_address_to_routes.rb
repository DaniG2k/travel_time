class AddStartAddressAndEndAddressToRoutes < ActiveRecord::Migration[5.0]
  def change
    remove_column :routes, :startcoords
    remove_column :routes, :endcoords
    add_column :routes, :start_address, :string
    add_column :routes, :end_address, :string
  end
end
