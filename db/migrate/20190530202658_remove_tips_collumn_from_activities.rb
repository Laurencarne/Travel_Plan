class RemoveTipsCollumnFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :tips, :text
  end
end
