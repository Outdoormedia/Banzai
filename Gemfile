source 'https://rubygems.org'

gem 'rails', '3.2.8'
gem 'thin'
# Bundle edge Rails instead:0
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem "mysql2"
gem "haml"
gem 'rack-pjax'
gem "acts_as_tree"

group :development, :test do
  #gem "rvm-capistrano"
  gem "thin"
  gem 'debugger'
  gem 'mysql2'
  gem 'taps', :require => false # has an sqlite dependency, which heroku hates
  gem 'sqlite3'                 # for Heroku you need taps, taps uses sqlite3  
end

gem 'sass', '3.3.0.alpha.3' # Temporary fix for Pow compatibility. Can be removed later.
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5' # Includes sass for asset pipeline
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3' # Minifier
end

gem 'jquery-rails', '~> 2.0.0' # Asset pipelined jquery
gem 'randumb' # Used for picking random carousels
gem 'cells' # Used for custom menu code
gem 'acts-as-taggable-on' # Used for tagging

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'rvm-capistrano'
gem 'capistrano_colors'

group :production do
  gem 'heroku'
  gem 'pg'
end

# Refinery CMS
gem 'refinerycms', :git => 'git://github.com/resolve/refinerycms.git', :branch => '2-0-stable'

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-i18n', '~> 2.0.0'
#  gem 'refinerycms-blog'
#  gem 'refinerycms-inquiries', '~> 2.0.5'
gem 'refinerycms-search', :path => 'vendor/extensions'
gem 'refinerycms-page-images', '~> 2.0.0'
gem 'refinerycms-snapshots', :path => 'vendor/extensions'
gem 'refinerycms-carousels', :path => 'vendor/extensions'
gem 'refinerycms-calendars', :path => 'vendor/extensions'

gem 'refinerycms-snapshots', :path => 'vendor/extensions'
gem 'refinerycms-plan_by_formats', :path => 'vendor/extensions'
