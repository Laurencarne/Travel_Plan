class RemovePublishedCollumnFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :published, :boolean
  end
end
