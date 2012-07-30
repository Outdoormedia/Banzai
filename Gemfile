source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'thin'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mysql2"
gem "acts_as_tree"
gem "haml-rails"


group :development, :test do
  #gem "rvm-capistrano"
  gem "thin"
  gem 'debugger'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'randumb'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem "rvm-capistrano"
gem "capistrano_colors"

# Refinery CMS
gem 'refinerycms', '~> 2.0.5'

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-i18n', '~> 2.0.0'
#  gem 'refinerycms-blog'
#  gem 'refinerycms-inquiries', '~> 2.0.5'
#  gem 'refinerycms-search', '~> 2.0.5'
gem 'refinerycms-page-images', '~> 2.0.0'
#  gem 'refinerycms-snapshots', :path => 'vendor/extensions'
gem 'refinerycms-carousels', :path => 'vendor/extensions'


group :production do
  gem 'heroku'
  gem 'pg'
end