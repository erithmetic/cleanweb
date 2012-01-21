source 'https://rubygems.org'

gem 'rails', '3.2.0'

gem 'crack'
gem 'devise'
gem 'draper'
gem 'high_voltage'
gem 'oauth'
gem 'omniauth-facebook'
gem 'omniauth-oauth'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'pg'
end

gem 'jquery-rails'

group :development do
  gem 'guard'
  gem 'sqlite3'
end

group :mac do
  gem 'growl'  # requires `brew install growlnotify`
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'fakeweb'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'vcr', '~> 2.0.0.rc1'
end
