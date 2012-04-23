source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'haml'

# for deployment on Heroku
gem "heroku"

group :development, :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'rack-cache', :require => 'rack/cache'
gem 'fog'
gem "dragonfly", '~>0.9.11'

# Gems for RefineryCMS
gem "refinerycms", "~> 2.0.2"
gem "refinerycms-page-images", '~>2.0.0'

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-i18n', '~> 2.0.0'
#  gem 'refinerycms-blog', '~> 2.0.0'
#  gem 'refinerycms-inquiries', '~> 2.0.0'
#  gem 'refinerycms-search', '~> 2.0.0'
#  gem 'refinerycms-page-images', '~> 2.0.0'
