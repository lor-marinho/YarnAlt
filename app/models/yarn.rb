class Yarn < ApplicationRecord
  belongs_to :brand
  has_many :yarn_materials
  has_many :materials, through: :yarn_materials
end
