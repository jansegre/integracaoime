# vim: filetype=ruby
source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'mongoid', '~> 3.0'
gem 'dalli'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'

  # The ruby debugger
  gem 'debugger', '~> 1.4.0', :platforms => :mri
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails'

  gem 'jquery-rails'
  gem 'font-awesome-sass-rails'
  gem 'bootstrap-sass', '~> 2.0'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '>= 0.11.3', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'

  # speed up assets compilation
  gem 'turbo-sprockets-rails3', '>= 0.3'
end

# A tree structure for Mongoid documents using the materialized path pattern
gem 'mongoid-tree', '~> 1.0', :require => 'mongoid/tree'

# An interface to the ImageMagick and GraphicsMagick image processing libraries.
gem 'rmagick', '~> 2.13'

# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks
gem 'carrierwave-mongoid', '~> 0.4', :require => 'carrierwave/mongoid'

# A Formtastic form builder that creates markup suitable for the Twitter Bootstrap framework.
gem 'formtastic-bootstrap'

# Beautiful, DRY, well-indented, clear markup: templating haiku.
gem 'haml-rails'

# Use unicorn as the app server
gem 'unicorn-rails', :platforms => :ruby

# Flexible authentication solution for Rails with Warden.
gem 'devise', '>= 2.2.2'

# The administration framework for Ruby on Rails applications.
gem 'activeadmin-mongoid', :github => 'jansegre/activeadmin-mongoid'

# This is a wysiyg html editor for the Active Admin interface using wysihtml5.
gem 'activeadmin-wysihtml5', github: 'jansegre/activeadmin-wysihtml5', require: 'activeadmin-wysihtml5'

# Rails plugin to conveniently handle multiple models in a single form.
gem 'nested_form'

