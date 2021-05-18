class CreateYarnMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :yarn_materials do |t|
      t.references :material, null: false, foreign_key: true
      t.references :yarn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
