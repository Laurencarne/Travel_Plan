class RemoveCollumnsFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :review
    remove_column :activities, :rating
    remove_column :activities, :photo
  end
end
