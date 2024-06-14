# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'aasm'
gem 'bootsnap', require: false
gem 'dry-validation'
gem 'importmap-rails'
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.7', '>= 7.0.7.2'
gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'sidekiq-cron'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails'
  gem 'rubocop'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
end

gem 'factory_bot_rails'

gem 'will_paginate', '~> 4.0'

gem 'pg_search', '~> 2.3'
