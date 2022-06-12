# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.0.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
gem 'psych', '< 4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# SIDEKIQ
gem 'sidekiq'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # rspec
  gem 'factory_bot_rails', '6.2.0'
  gem 'rspec-rails', '5.0.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '~> 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # https://github.com/rubocop/rubocop
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  # https://github.com/BetterErrors/better_errors
  gem 'better_errors'
  gem 'binding_of_caller'
  # https://github.com/ctran/annotate_models
  gem 'annotate'
end

group :test do
  gem 'net-smtp', require: false
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner-active_record'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # https://github.com/faker-ruby/faker
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 5.0'
  # https://github.com/simplecov-ruby/simplecov
  gem 'simplecov', require: false
  # https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing', '1.0.5'
  # rspec-sidekiq
  gem 'rspec-sidekiq'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Auth + Policies
# https://github.com/heartcombo/devise
gem 'devise'
# https://github.com/varvet/pundit
gem 'pundit'

# Haml: https://github.com/haml/haml
gem 'haml'
gem 'haml-rails', '~> 2.0'

# Decorators
# https://github.com/drapergem/draper
gem 'draper'

# https://github.com/jwt/ruby-jwt
gem 'jwt'
