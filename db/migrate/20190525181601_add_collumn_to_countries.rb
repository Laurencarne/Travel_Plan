class AddCollumnToCountries < ActiveRecord::Migration[5.2]
  def change
    add_column :countries, :continent, :string
  end
end
