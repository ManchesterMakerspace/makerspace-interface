source 'https://rubygems.org'

gem 'rails', '~> 5.2.2'
gem 'rack-cors'
gem 'puma', '~> 3.0'
gem 'active_model_serializers'
gem 'dotenv-rails'
gem 'webpacker'

# Pin ffi b/c 1.10 has issues installing
gem 'ffi', '1.9.25'

#authentication
gem 'devise'
gem 'bcrypt'
#Use Mongo DB
gem 'mongoid', '~> 7.0.2'
gem 'mongoid_search'
#Paypal IPN
gem 'paypal-sdk-rest'
gem "braintree"
gem "slack-ruby-client"
gem 'google-api-client', require: ['google/apis/drive_v3']
gem 'mini_magick'

group :development do
  gem 'byebug', platform: :mri
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'mongoid-rspec'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'simplecov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
