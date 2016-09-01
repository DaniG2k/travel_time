class FixRouteColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :routes, :start, :startcoords
    rename_column :routes, :end, :endcoords
  end
end
