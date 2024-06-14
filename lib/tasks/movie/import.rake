# frozen_string_literal: true

# rake environment admin:import

namespace :movie do
  task :import do
    Movie::ImportJob.perform_async
  end
end
