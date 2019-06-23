class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :price
      t.text :notes
      t.text :review
      t.string :photo
      t.text :tips
      t.boolean :published
      t.integer :rating
      t.string :street_name
      t.string :city
      t.string :zip_code
      t.integer :country_id

      t.timestamps
    end
  end
end
