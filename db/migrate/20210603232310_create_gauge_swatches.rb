class CreateGaugeSwatches < ActiveRecord::Migration[6.0]
  def change
    create_table :gauge_swatches do |t|
      t.string :image_url
      t.string :gauge
      t.string :needles
    end
  end
end
