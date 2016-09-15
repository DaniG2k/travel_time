class FixPathColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :paths, :start, :startcoords
    rename_column :paths, :end, :endcoords
  end
end
