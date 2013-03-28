source "https://rubygems.org"

# need to specify 1.9.3 for heroku
# mongoid 3 only works with Ruby 1.9.3
ruby "1.9.3"

gem "rails", "~> 3.2.8"

gem "thin", "~> 1.4.1"

# database
gem "bson_ext", "~> 1.6.4"
gem "mongoid", "~> 3.0.4"

# view
gem "haml", "~> 3.1.6"
gem "will_paginate"
gem "rabl"

# authentication
gem "devise", "~> 2.1.2"
gem "omniauth", "~> 1.1.0"
gem "omniauth-facebook", "~> 1.4.1"

# queue
gem "resque", "~> 1.21.0"
gem "resque_mailer", "~> 2.1.0"
gem "resque-retry", "~> 0.2.2"
gem "resque-cleaner", "~> 0.2.9"

# file upload
gem "mini_magick", "~> 3.4"
gem "fog", "~> 1.5.0"
gem "carrierwave-mongoid", :git => "git://github.com/jnicklas/carrierwave-mongoid.git", :branch => "mongoid-3.0"

# email
gem "sendgrid", "~> 1.0.1"

# analytics
gem "mixpanel"

# in production environments by default.
group :assets do
  gem "handlebars_assets"
  gem "sass-rails",   "~> 3.2.5"
  gem "jquery-rails"

  gem "uglifier", ">= 1.0.3"
end

group :development do
  gem "heroku"
end

group :production do
end

group :test do
  gem "cucumber-rails"
end
