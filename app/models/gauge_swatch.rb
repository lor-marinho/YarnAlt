class GaugeSwatch < ApplicationRecord
  has_one_attached :image_url

  has_many :yarn_gauge_swatches, dependent: :destroy
  has_many :yarns, through: :yarn_gauge_swatches
  belongs_to :user
end
