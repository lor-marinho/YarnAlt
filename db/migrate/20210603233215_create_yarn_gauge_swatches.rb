class CreateYarnGaugeSwatches < ActiveRecord::Migration[6.0]
  def change
    create_table :yarn_gauge_swatches do |t|
      t.references :gauge_swatch, null: false, foreign_key: true
      t.references :yarn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
