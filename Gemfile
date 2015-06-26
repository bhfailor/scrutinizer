source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.2'

gem 'rails-api'

gem 'pg'

# To use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# asynchronous processes
gem 'sidekiq'

group :production do
  # Use Unicorn as the app server
  gem 'unicorn'
  # Include 'rails_12factor' gem to enable all platform features
  # See https://devcenter.heroku.com/articles/rails-integration-gems
  gem 'rails_12factor'
end

group :development, :test do
  # to support https://github.com/blowmage/minitest-rails-capybara
  gem 'minitest-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  #   console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the
  #   background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
  gem 'puma'
  gem 'pry'
end

group :test do
  # from pfox
  gem 'simplecov', :require => false
  # from https://github.com/codeclimate/ruby-test-reporter
  gem 'codeclimate-test-reporter', require: nil
  # from https://github.com/wojtekmach/minitest-metadata
  gem 'minitest-metadata', require: false
  # http://chriskottom.com/blog/2014/06/dress-up-your-minitest-output/
  gem 'minitest-reporters'
  # Adding back in to see if it helps Code Climate coverage and it does
  # from https://github.com/blowmage/minitest-rails-capybara
  gem 'minitest-rails-capybara'
  
end
