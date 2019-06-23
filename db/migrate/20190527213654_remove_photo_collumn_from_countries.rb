class RemovePhotoCollumnFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :countries, :photo
  end
end
