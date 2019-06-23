class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.text :information
      t.string :language
      t.string :flag
      t.string :photo
      t.string :alpha2

      t.timestamps
    end
  end
end
