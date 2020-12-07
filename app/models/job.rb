class Job < ApplicationRecord
  belongs_to :user
  has_many :proposals

  include PgSearch::Model
  pg_search_scope :search_by_language,
    against: [ :content ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
