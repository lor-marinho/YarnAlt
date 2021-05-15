class RemoveFiberFromYarns < ActiveRecord::Migration[6.0]
  def change
    remove_column :yarns, :fiber, :string
  end
end
