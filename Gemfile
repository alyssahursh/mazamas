source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.7'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 0.19.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Stripe for payment processing
gem 'stripe', :git => 'https://github.com/stripe/stripe-ruby'

# Use Mandrill for transactional emails
gem 'mandrill-api'

# Use Stormpath for user authentication
gem 'stormpath-sdk'
gem 'stormpath-rails'

# Use dotenv to load environment variables
gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'

# For API interaction
gem 'httparty'
gem 'webmock'

# Add postgresql enum functionatlity to migrations
gem "schema_plus_enums"


# Pagination gem
gem 'will_paginate', '~> 3.1.0'

# Maps!
gem 'mapbox-rails'





# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Standard testing suite
  gem 'better_errors'
  gem 'awesome_print'
  gem 'minitest-reporters'
  gem 'simplecov'

  # Use faker for seeding placeholder user data
  gem "faker"

  # Fixture fixer
  gem 'db_fixtures_dump'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0', group: :development

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Rake erd to get a ERD of the current schema
  gem "rails-erd"

  # Use Rails Panel for Chrome for logs
  gem 'meta_request'
end

group :production do
  # Use PostgreSQL as the database for Active Record
  gem 'pg', '~> 0.19.0'
end
