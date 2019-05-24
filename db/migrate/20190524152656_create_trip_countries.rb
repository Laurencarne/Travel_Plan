class CreateTripCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_countries do |t|
      t.integer :trip_id
      t.integer :country_id

      t.timestamps
    end
  end
end
