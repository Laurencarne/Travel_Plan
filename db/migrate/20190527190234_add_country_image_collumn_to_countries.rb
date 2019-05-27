class AddCountryImageCollumnToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :country_image, :string
  end
end
