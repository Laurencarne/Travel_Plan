class RemoveCollumnsFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :countries, :alpha2, :string
    remove_column :countries, :language, :string
  end
end
