source 'https://rubygems.org'

ruby '2.3.1'
gem 'rails', '4.0.13'

gem 'pg'
gem 'carrierwave'
gem 'cloudinary'
gem 'phony_rails'
gem 'js_stack'
gem 'rollbar'
gem 'figaro'

# spree
gem 'spree', github: 'spree/spree', branch: '2-1-stable'
gem 'spree_fancy', github: 'spree/spree_fancy', branch: '2-1-stable'
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: '2-1-stable'
gem 'spree_i18n', github: 'spree/spree_i18n', branch: '2-1-stable'

# assets
gem 'sass-rails', '~> 4.0.0'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.0'
end

group :staging do
  gem 'unicorn'
end

group :production do
  gem 'rails_12factor'
end
