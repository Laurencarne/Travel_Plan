class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.datetime :date
      t.string :travel_companions
      t.integer :user_id
      t.boolean :published

      t.timestamps
    end
  end
end
