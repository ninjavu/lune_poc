# frozen_string_literal: true

class Movie < ApplicationRecord
  self.per_page = 10
  
  has_many :reviews, dependent: :destroy

  validates :movie, uniqueness: true
end
