class AddVisitDurationToPaths < ActiveRecord::Migration[5.0]
  def change
    add_column :paths, :visit_duration, :integer
  end
end
