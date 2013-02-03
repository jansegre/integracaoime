source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'mongoid', '~> 3.0'
gem 'dalli'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'

  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'

  # The ruby 1.9 debugger
  gem 'debugger'
end

group :production do
  gem 'mysql2'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  gem 'jquery-rails'
  gem 'font-awesome-sass-rails'
  gem 'bootstrap-sass'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  # speed up assets compilation
  gem 'turbo-sprockets-rails3', '>= 0.3'
end

# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave-mongoid', '~> 0.4', :require => 'carrierwave/mongoid'

# A Formtastic form builder that creates markup suitable for the Twitter Bootstrap framework.
gem 'formtastic-bootstrap'

# Beautiful, DRY, well-indented, clear markup: templating haiku.
gem 'haml'

# Use unicorn as the app server
gem 'unicorn-rails', :platforms => :ruby

# Flexible authentication solution for Rails with Warden.
gem 'devise', '>= 2.2.2'

# The administration framework for Ruby on Rails applications.
gem 'activeadmin-mongoid', :github => 'jansegre/activeadmin-mongoid'

