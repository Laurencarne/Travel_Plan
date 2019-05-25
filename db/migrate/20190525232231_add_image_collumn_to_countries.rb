class AddImageCollumnToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :continent_image, :string
  end
end
