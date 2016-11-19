source 'https://rubygems.org'
ruby '2.2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# so that the templates work
gem 'angular-rails-templates'
# use unicorn for the webserver
gem 'unicorn'
# Use responders for json respond_to
gem 'responders'
# Use angular_rails_csrf for CSRF Token Support
gem 'angular_rails_csrf'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use curb for libcurl bindings
gem 'curb'
# Use mechanize for traditional scraping
gem 'mechanize'
# Use sucker punch to minimize costs (web dyno can do workers)
gem 'sucker_punch'
# Use fist of fury for recurring sucker_punch jobs
gem 'fist_of_fury'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Database stuff
group :production do 
  # Use pg database for heroku
  gem 'pg'
  # Use rails_12factor for heroku
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
end

