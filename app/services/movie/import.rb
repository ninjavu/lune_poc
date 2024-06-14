# frozen_string_literal: true

require 'csv'

class Movie::Import
  # [TODO] I can process in batch and also use alphabetical sort in order to scale.
  
  def call(file_name: '')
    movies_csv = "#{Rails.root}/lib/movies.csv"
    reviews_csv =  "#{Rails.root}/lib/reviews.csv"

    header_converter = proc { |field| field.downcase.parameterize.underscore }
    movies_batch = []
    reviews_batch = []

    CSV.foreach(movies_csv, headers: true, header_converters: header_converter) do |movie|
      movies_batch << movie.to_h
    rescue StandardError
      next
    end

    movies_map = Movie.insert_all(movies_batch, returning: [:movie, :id], unique_by: :movie).rows.to_h
    
    CSV.foreach(reviews_csv, headers: true, header_converters: header_converter) do |review|
      review['movie_id'] = movies_map[review['movie']]
      reviews_batch << review.to_h.except('movie')
    rescue StandardError
      next
    end

    Review.insert_all(reviews_batch)
  end
end
