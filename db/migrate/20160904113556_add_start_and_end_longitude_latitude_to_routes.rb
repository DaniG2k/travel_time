class AddStartAndEndLongitudeLatitudeToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :start_lon, :float
    add_column :routes, :start_lat, :float
    add_column :routes, :end_lon, :float
    add_column :routes, :end_lat, :float
  end
end
