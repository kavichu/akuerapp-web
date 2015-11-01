source 'https://rubygems.org'


gem 'rails', '4.2.3'

gem 'rails-api'
gem 'rspec-rails'

gem "active_model_serializers", github: "rails-api/active_model_serializers"
gem 'responders', '~> 2.0'
gem 'will_paginate', '~> 3.0.6'#, :require => nil


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

gem 'activerecord-postgis-adapter'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # gem 'sqlite3'
  gem 'pg'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
end
