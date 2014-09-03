# Vic Ramon's Rails Template (http://vicramon.com)
#
# To use this template:
#
# $ rails new <app_name> -m new_template.rb -S -T -d postgresql

# Install gems
gem 'adequate_exposure'
gem 'ffaker'
gem 'haml-rails'
gem 'puma'

gem_group :production do
  gem 'rails_12factor'

gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'dotenv-rails'
  gem 'quiet_assets'
end

gem_group :development, :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'fabrication'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

run "rvm gemset create #{app_name}"
run "rvm gemset use #{app_name}"
run "bundle install"

rake "db:create"
rake "db:migrate"

generate "rspec:install"
generate "cucumber:install"

remove_file 'public/index.html'

git :init
