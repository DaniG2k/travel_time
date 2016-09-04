class AddVisitDurationToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :visit_duration, :integer
  end
end
