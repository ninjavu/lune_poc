# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    movies = ::Movie::Get.new.call(
      actor: permitted_params['actor']
    )

    render json: { movies: }, status: 200
  end

  def permitted_params
    params.permit(:actor)
  end
end
