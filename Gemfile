source 'https://rubygems.org'

ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0.beta2'

group :production do 
  gem 'pg'
  gem 'rails_12factor'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'jbuilder', '~> 1.2'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc',          group: :doc, require: false

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/jonleighton/spring
# gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.2'

gem "jquery-rails"

gem "non-stupid-digest-assets"

gem 'thin'

gem "font-awesome-rails"

# gem "twitter-bootstrap-rails"
# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :test, :development do 
  gem 'sqlite3'
	gem 'rspec-rails', git: 'git@github.com:rspec/rspec-rails.git'
end

group :test do
  # gem 'rspec-rails' #, git: 'git@github.com:rspec/rspec-rails.git'
  gem 'shoulda-matchers'
  gem 'capybara', '>=2.2.0'
  gem "capybara-webkit"
  gem 'factory_girl_rails'
  gem "database_cleaner" #, '1.0.0.RC1'
  gem 'timecop'
end

group :development do 
  gem 'annotate', ">=2.5.0"
  gem 'faker'
end