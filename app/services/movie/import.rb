# frozen_string_literal: true

require 'csv'

class Movie::Import
  def call(file_name: '')
    movies_csv = "#{Rails.root}/lib/movies.csv"
    reviews_csv =  "#{Rails.root}/lib/reviews.csv"

    header_converter = proc { |field| field.downcase.parameterize.underscore }
    movies_batch = []
    reviews_batch = []
    latest_cluster = ''

    from = CSV.open(movies_csv, headers: true) { |csv| csv.first }['Movie'].underscore[0]

    (from..'z').each do |cluster|
      CSV.foreach(movies_csv, headers: true, header_converters: header_converter) do |movie|
        next if movie['movie'][0].downcase <= latest_cluster

        if movie['movie'].downcase.starts_with?(cluster)
          movies_batch << movie.to_h
        else
          break
        end
      rescue StandardError
        next
      end

      if movies_batch.empty?
        next
        latest_cluster = cluster
      end
  
      movies_map = Movie.insert_all(movies_batch, returning: [:movie, :id], unique_by: :movie).rows.to_h
      movies_batch = []
      
      CSV.foreach(reviews_csv, headers: true, header_converters: header_converter) do |review|
        next if review['movie'][0].downcase <= latest_cluster

        if review['movie'].downcase.starts_with?(cluster)
          review['movie_id'] = movies_map[review['movie']]
          reviews_batch << review.to_h.except('movie')
        else
          break
        end
      rescue StandardError
        next
      end
  
      Review.insert_all(reviews_batch)
      reviews_batch = []
      latest_cluster = cluster
    end
  end
end
