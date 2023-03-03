source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", github: "rails/rails", branch: "main"

gem "bcrypt"
gem "bootsnap", require: false
gem "importmap-rails"
gem "propshaft"
gem "phlex-rails"
gem "puma"
gem "sqlite3"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "turbo-rails"

group :development, :test do
  gem "debug"
end

group :development do
  gem "foreman"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
