class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.integer :price
      t.text :notes
      t.text :review
      t.string :photo
      t.integer :country_id
      t.text :tips
      t.boolean :published

      t.timestamps
    end
  end
end
