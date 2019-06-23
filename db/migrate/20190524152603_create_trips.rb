class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :travel_companions
      t.boolean :published
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
