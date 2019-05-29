class AddContinentInfoCollumnToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :continent_info, :text
  end
end
