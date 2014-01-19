# -*- encoding : utf-8 -*-
source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '~> 4.0.2'

gem 'haml', '~> 3.1.6'
gem 'sass', '~> 3.2.4'
gem "devise", '~> 3.2.2'
gem "gmaps4rails", '~> 2.1.1'
gem 'jquery-rails', '~> 3.0.4'
gem 'dynamic_form', '~> 1.1.4'
gem 'protected_attributes'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 4.0.1'
  gem 'coffee-rails', '~> 4.0.1'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.14.1'
  gem 'mocha', '~> 1.0.0', :require => nil
  gem 'factory_girl_rails', '~> 4.0'
  gem 'debugger'
  gem 'sqlite3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'
group :production do
  gem 'rails_12factor'
  gem 'pg'
end
