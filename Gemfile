source 'https://rubygems.org'

ruby "2.6.5"

gem "rails", "~>5.2"
gem "rails-i18n"
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem "rake"
gem "pg"
gem "puma"
gem "bootsnap"
gem "rack-timeout"
gem "rack-rewrite"
gem "devise"
gem "pundit"
gem "minitest-rails"
gem "delayed_job_active_record"

group :test do
	gem "minitest-rails-capybara"
end

group :development, :test do
  gem "foreman"
end

group :development do
	gem "listen"
  gem 'meta_request'
end

gem 'sassc-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder'
gem "yajl-ruby"

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem "bourbon"
gem 'ransack'
gem 'annotate'
gem "paperclip"
gem "paperclip-storage-ftp"
gem "delayed_paperclip"
gem "nested_form"
gem "geocoder"
gem "slim-rails"
gem "mail_form"

# heroku
group :production do
	gem 'rails_12factor'
end

gem 'awesome_nested_set'
gem 'acts-as-taggable-on', github: 'Fodoj/acts-as-taggable-on', branch: 'rails-5.2'
gem 'kaminari'
gem 'friendly_id'
gem "simple_calendar", "~> 1.1.0"
gem "browser"
gem 'canonical-rails', git: 'https://github.com/jumph4x/canonical-rails.git'
gem 'sitemap_generator'
gem "autoprefixer-rails"
gem "meta-tags"

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
