source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.4.1'
gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'sqlite3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
#Bootstrap and jquery needed for the view
gem "bootstrap", ">= 4.1.2"
gem 'devise'
gem 'jquery-rails'
group :development do
  gem 'rails_layout'
end

#For storing avatar image
gem 'carrierwave', '~> 1.0'

#Install visualizer - does not work on AWS!
#gem 'rails-erd', group: :development

#Geographical locations
gem 'geocoder'

#Generating random test data
gem 'faker'
