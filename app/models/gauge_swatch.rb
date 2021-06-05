class GaugeSwatch < ApplicationRecord
  has_many :yarn_gauge_swatches
  has_many :yarns, through: :yarn_gauge_swatches
end
