source 'https://rubygems.org'
ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# gem 'responders', '~> 2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use opal as the JavaScript library
# gem 'opal-rails'
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'jquery-turbolinks'
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'gravtastic'
gem 'haml-rails', '~> 0.8'
gem 'figaro'
gem 'redcarpet'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'nested_form_fields'
gem 'bourbon'
gem 'friendly_id', '~> 5.1.0'
gem 'newrelic_rpm'
gem 'font-awesome-rails'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'pg'
gem 'rails_12factor'

group :development, :test do
  # Use sqlite3 as the database for Active Record
  # gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rubocop', '0.30.0'
  gem 'factory_girl_rails'
  # gem 'pry-rails'
  gem 'jazz_hands2'
  gem 'awesome_print', github: 'eoinkelly/awesome_print'
end

group :development do
  gem 'thin'
  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.4', require: false
  gem 'faker'
  gem 'better_errors'
  gem 'letter_opener'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'capybara'
  gem 'simplecov', require: false
end

group :production do
  gem 'unicorn'
end
