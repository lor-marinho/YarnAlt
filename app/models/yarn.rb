class Yarn < ApplicationRecord
  belongs_to :brand, dependent: :destroy
  has_many :yarn_materials
  has_many :materials, through: :yarn_materials
end
