class YarnGaugeSwatch < ApplicationRecord
  belongs_to :gauge_swatch, dependent: :destroy
  belongs_to :yarn
end


