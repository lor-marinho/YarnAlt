class AddDiscontinuedAndImageUrlToYarns < ActiveRecord::Migration[6.0]
  def change
    add_column :yarns, :discontinued, :boolean
    add_column :yarns, :image_url, :string
  end
end
