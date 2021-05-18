class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :fiber_type
      t.integer :percentage

      t.timestamps
    end
  end
end
