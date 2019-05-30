class RemoveFlagsCollumnFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :countries, :flag, :string
  end
end
