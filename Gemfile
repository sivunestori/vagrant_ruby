source 'https://rubygems.org'
# Pre-install stuff... start admin using INCLUDE_ADMIN_FUNCTIONALITY=true bundle exec rails s

gem 'rails', '4.2.1'
gem 'sass-rails', '~> 4.0.0' # Sass framework
gem 'compass-rails' # Compass framework
gem 'bootstrap-sass', '~> 3.1.1' # Bootstrap framework
gem 'dotenv-rails' # Store environment configuration in .env
gem 'dotenv-deployment' # Loading of .env.production into ENV

gem 'dogapi' # custom metrics from application

gem 'uglifier', '>= 1.3.0' # JavaScript compression
gem 'coffee-rails', '~> 4.0.0' # CoffeeScript for .js.coffee
gem 'jquery-rails' # jQuery support
gem 'turbolinks' # Read more: https://github.com/rails/turbolinks
gem 'jquery-turbolinks' # jQuery events + turbolinks integration
gem 'jbuilder', '~> 1.2' # JSON API support
gem 'unread' # Support for unread messages
gem 'pg' # Postgresql driver
gem 'rack-attack' # HTTP throttling etc
gem 'hashery' # Better hashes http://rubyworks.github.io/hashery/
gem 'sidekiq' # Background jobs
gem 'whenever', require: false # Cron updater for Ruby
gem 'net-ntp' # Time needs to be synchronized => ntp

#
# START ADMIN
#
load_admin = ENV['INCLUDE_ADMIN_FUNCTIONALITY']

gem 'activeadmin', git: 'https://github.com/gregbell/active_admin', require: !!load_admin
gem 'chosen-rails', require: !!load_admin
gem 'sinatra', require: !!load_admin
gem 'activeadmin-dragonfly', github: 'stefanoverna/activeadmin-dragonfly', require: !!load_admin
gem 'activeadmin-wysihtml5', github: 'stefanoverna/activeadmin-wysihtml5', require: !!load_admin

#
# END ADMIN
#

gem 'paper_trail', '~> 3.0.1' # Audit create, update, delete
gem 'devise' # Authentication with Devise
gem 'devise-async' # Mail queueing so we can recover from email server errors
gem 'slim' # Slim for views, not Haml or Erb
gem 'slim-rails' # Slim generators for Rails
gem 'html2slim' # For converting Erb to Slim or Haml
gem 'country_select' # Country <select>
gem 'settingslogic' # Settings, see config/application.yml
gem 'pundit' # Authorization
gem 'puma' # TODO: benchmark against unicorns
gem 'version' # Versioning helper
gem 'kaminari' # Pagination
gem 'yaml_db', git: 'https://github.com/jetthoughts/yaml_db', ref: 'fb4b6bd7e12de3cffa93e0a298a1e5253d7e92ba' # Import/export data from/to YAML
gem 'mail_view', '~> 2.0.4' # Preview mails in your browser
gem 'flamegraph' # Flame graphs for mini-profiler
gem 'premailer-rails' # CSS for emails
gem 'recaptcha', require: 'recaptcha/rails'
gem 'rack-protection' # protects against typical web attacks
gem 'secure_headers' # apply HTTP headers related to security
gem 'bower-rails', '~> 0.7.1' # bower support for rails
gem 'pry-rails' # Better console, REPL-driven programming, etc
gem 'hirb' # Better console
gem 'awesome_print' # Pretty output with ap and object.ai methods
gem 'statsd-ruby'

group :production do
  # NOTE: this shit fucks up guard+pry-rescue
  gem 'rb-readline' # Doesn't fix spork + pry-remote problems
end

group :staging, :production do
  gem 'bugsnag' # Track bugs
  gem 'dogstatsd-ruby'
  gem 'redis-rails'
end

group :development, :staging do
  gem 'rack-mini-profiler' # Shows profiling information in the browser
end

group :development, :test, :staging do
  # NOTE: we want to be able to generate fake data for tests
  gem 'faker' # Fake data for tests
  gem 'factory_girl_rails' # Better fixtures
end

group :profile do
  gem 'ruby-prof'
end

group :development do
  gem 'rails-dev-boost' # Faster development environment
  gem 'brakeman', :require => false # Checks for security vulnerabilities.
  gem 'better_errors' # Better Rails error pages
  gem 'binding_of_caller', git: 'https://github.com/banister/binding_of_caller.git'
  gem 'meta_request' # Rails panel https://github.com/dejan/rails_panel/tree/master/meta_request
  gem 'mina' # Better than capistrano
  gem 'mina-sidekiq' # Tasks for mina/sidekiq
  gem 'rubocop' # Will enforce many of the guidelines outlined in the community Ruby Style Guide.
  gem 'rails_best_practices' # Enforce best practices
  gem 'rails-erd' # Run erd to generate a data model graph
  gem 'fl-rocco' # Generate documentation by running 'rocco *'. Requires sudo apt-get install python-pygments
  gem 'mailcatcher' # Catch and host emails on http://localhost:1080
  # TODO enable bullet in test environment
  gem 'bullet' # Identify slow queries, see config/initializers/bullet.rb
  gem 'rb-fsevent', '~> 0.9.1'

  gem 'guard' # Autorun tests, etc
  gem 'guard-bundler'
  gem 'guard-rubocop' # Enforce coding guidelines
  gem 'bundler-audit' # run $ bundle-audit to show security issues with gems
  gem 'guard-bundler-audit' # Automatic security scans with bundler-audit
end

group :test do
  gem 'guard-minitest'
  gem 'guard-brakeman' # Security audits, fool
  gem 'minitest-rails' # Not rspec shit. Try not to use any other minitest/test gems as they all suck anus.
  gem 'database_cleaner' # Clean database between tests when not using transactional tests
  gem 'capybara', :git => 'https://github.com/jnicklas/capybara.git' # Integration tests
  gem 'capybara-webkit' # Webkit for capybara
  gem 'headless' # For webkit
  gem 'launchy'
  gem 'fakeweb', '~> 1.3' # Don't allow web traffic in tests
  gem 'mocha' # Mocking bird
end

group :test, :development do
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'byebug'
  gem 'pry-byebug' # next, step commands for pry.
  gem 'libnotify' if /linux/ =~ RUBY_PLATFORM # For test notifications etc
  gem 'guard-zeus'
end

group :doc do
  gem 'sdoc', require: false
end
