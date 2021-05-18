class Material < ApplicationRecord
  has_many :yarns, through: :yarn_materials
end
