class CreateYarns < ActiveRecord::Migration[6.0]
  def change
    create_table :yarns do |t|
      t.string :name
      t.string :weight
      t.string :fiber
      t.string :needles
      t.string :gauge
      t.string :price
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
