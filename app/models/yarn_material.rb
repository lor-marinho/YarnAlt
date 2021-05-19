class YarnMaterial < ApplicationRecord
  belongs_to :material, dependent: :destroy
  belongs_to :yarn
end
