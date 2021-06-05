class AddUserRefToGaugeSwatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :gauge_swatches, :user, foreign_key: true
  end
end
