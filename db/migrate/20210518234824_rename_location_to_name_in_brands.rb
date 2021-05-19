class RenameLocationToNameInBrands < ActiveRecord::Migration[6.0]
  def change
    rename_column :brands, :location, :name
  end
end
