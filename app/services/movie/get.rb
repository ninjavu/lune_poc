# frozen_string_literal: true

class Movie::Get
  def call(actor:)
    result = ::Movie

    if actor.present?
      result = result.search_actor(actor)
                     .reorder('')
    end

    result
      .select('movies.id, movies.actor, movies.movie, avg(reviews.stars)')
      .joins(:reviews)
      .group('movies.id, movies.movie')
      .order('avg(reviews.stars) desc')
  end
end
