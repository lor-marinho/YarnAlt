class Yarn < ApplicationRecord
  belongs_to :brand
  has_many :yarn_materials
  has_many :materials, through: :yarn_materials

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
