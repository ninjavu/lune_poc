# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    # [TODO] Add index for actor.
    # [TODO] Move logic to service.
    # [TODO] Use pagination component in React.
    # [TODO] Use debounce in order to avoid highload.

    filter = { actor: permitted_params['actor'] }.compact_blank

    movies = Movie.select('movies.id, movies.movie, avg(reviews.stars)')
                  .where(filter)
                  .paginate(page: params[:page])
                  .joins(:reviews)
                  .group('movies.id, movies.movie')
                  .order('avg(reviews.stars) desc')

    render json: { movies: }, status: 200
  end

  def permitted_params
    params.permit(:actor)
  end
end
