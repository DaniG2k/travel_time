class AddStartAndEndLongitudeLatitudeToPaths < ActiveRecord::Migration[5.0]
  def change
    add_column :paths, :start_lon, :float
    add_column :paths, :start_lat, :float
    add_column :paths, :end_lon, :float
    add_column :paths, :end_lat, :float
  end
end
