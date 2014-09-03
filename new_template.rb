# Vic Ramon's Rails Template (http://vicramon.com)
#
# To use this template:
#
# $ rails new <app_name> -m new_template.rb -B -T -d postgresql

gem 'adequate_exposure'
gem 'ffaker'
gem 'haml-rails'
gem 'puma'

gem_group :production do
  gem 'rails_12factor'
end

gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
end

gem_group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

gem_group :development, :test do
  gem 'dotenv-rails'
  gem 'fabrication'
  gem 'pry-rails'
end

run "rvm gemset create #{app_name}"
run "rvm gemset use #{app_name}"
run "bundle install"

rake "db:create:all"
rake "db:migrate"

generate "rspec:install"
generate "cucumber:install"

remove_file 'public/index.html'

git :init
