class CreateSelectedActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :selected_activities do |t|
      t.integer :trip_country_id
      t.integer :activity_id

      t.timestamps
    end
  end
end
