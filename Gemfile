source 'http://rubygems.org'
ruby "1.9.3"  # Need to specify ruby version for Heroku production ruby to match dev ruby
gem 'rails', '3.2.8'
gem 'heroku'
gem "thin" # dev and production server replacement for WEBrick
# gem 'bootstrap-sass' # Twitter bootstrap for UI support

# MongoDB
gem 'mongoid', '~> 3.0.0'
gem 'moped'
gem 'bson_ext' # This seems to be crashing foreman
# gem 'sqlite3'

gem 'jquery-rails'

gem 'haml-rails'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end



gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails"
  # gem "capybara"
  # gem "gaurd-rspec"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
