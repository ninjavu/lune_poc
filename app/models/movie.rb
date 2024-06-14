# frozen_string_literal: true

class Movie < ApplicationRecord
  include PgSearch::Model
  pg_search_scope(
    :search_actor,
    against: :actor,
    using: {
      tsearch: {
        dictionary: 'english',
        tsvector_column: 'tsv'
      }
    }
  )

  self.per_page = 10

  has_many :reviews, dependent: :destroy

  validates :movie, uniqueness: true
end
