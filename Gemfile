source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.2'
gem 'pg', '0.15.1'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem "haml"
gem "haml-rails"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "modernizr-rails"

gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', ' 2.1.1'
gem "bootstrap-sass", "~> 3.0.1.0.rc"
gem "underscore-rails"
gem "backbone-rails"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]

group :development, :test do
  gem "quiet_assets"
  gem "pry-rails"
  gem "pry-debugger"
  gem "awesome_print"
  gem "traceroute"
end

group :test do
  gem 'rspec-rails', '2.13.1'
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'simplecov', :require => false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end
