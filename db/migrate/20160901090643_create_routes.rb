class CreateRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :start
      t.string :end
      t.float :travel_time

      t.timestamps
    end
  end
end
