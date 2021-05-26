class AddLocationToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :location, :string
  end
end
