# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'rails', '~> 7.1.2'

#admin
gem 'activeadmin'

gem 'bootsnap', require: false
gem 'cocoon'
gem 'devise'
gem 'doorkeeper'
gem 'haml'
gem 'jquery-rails'
gem 'kaminari'
gem 'mysql2'
gem 'pagy'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'trix-rails', require: 'trix'
gem 'uglifier', '>= 1.3.0'

gem 'acts_as_list'

gem 'bootstrap'

gem 'font-awesome-rails'
gem 'font-awesome-sass'


# Country
gem 'country_select', '~> 4.0'

# backgroud job
gem 'resque'
gem 'resque-scheduler'

# Use Active Storage
gem 'active_storage_validations'
gem 'image_processing', '~> 1.2'
gem 'mini_magick', '>= 4.9.5'

# For Excel file read
gem 'roo', '~> 2.8.0'
gem 'roo-xls'

# for currency
gem 'money-rails'

gem 'humanize'

gem 'turbolinks', '~> 5.2.0'

# for sidekiq
gem 'sidekiq', '~> 6.5.9'
gem 'sidekiq-cron'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'active_record_query_trace'

  gem 'erb2haml'

  gem 'letter_opener'

  gem 'brakeman'

  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rails_config'

  gem 'web-console'

  gem 'capistrano', '~> 3.17', '>= 3.17.1'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-resque', '~> 0.2.3', require: false
  gem 'capistrano-rvm'
  gem 'sshkit-sudo'

end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bundler', '2.4.21'
