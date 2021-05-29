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
  pg_search_scope :search_by_weight,
  against: [ :weight ],
  using: {
    tsearch: { prefix: true }
  }
  pg_search_scope :search_by_needles,
  against: [ :needles ],
  using: {
    tsearch: { prefix: true }
  }
  pg_search_scope :search_by_gauge,
  against: [ :gauge ],
  using: {
    tsearch: { prefix: true }
  }

  pg_search_scope :search_by_brand,
    associated_against: {
      brand: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
  }
end
