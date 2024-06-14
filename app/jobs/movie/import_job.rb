# frozen_string_literal: true

class Movie::ImportJob
  include Sidekiq::Job
  sidekiq_options retry: false

  def perform
    ::Movie::Import.new.call
  end
end
