source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0.rc1'

# gem 'capistrano-rails', group: :development
gem 'babel-transpiler'
gem 'bootsnap', require: false
gem 'bootstrap-sass', '~> 3.3.6'
gem 'cancancan', '~> 2.0'
gem 'carrierwave', '~> 1.1'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.2'
gem 'devise_masquerade', '~> 0.6'
gem 'flutie', '~> 2.0'
gem 'font-awesome-sass', '~> 4.7'
gem 'gretel', '~> 3.0'
gem 'hamlit-rails', '~> 0.2'
gem 'high_voltage', '~> 3.0'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rolify', '~> 5.1'
gem 'rubocop', '~> 0.49', require: false
gem 'sass-rails', github: 'rails/sass-rails', require: false
gem 'sassc-rails', github: 'sass/sassc-rails'
gem 'simple_form', '~> 3.5'
gem 'summernote-rails', '~> 0.8'
gem 'title', '~> 0.0.7'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'bullet', '~> 5.4'
  gem 'dotenv-rails', '~> 2.2'
  gem 'ffaker'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-footnotes'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'bundler-audit', '~> 0.5.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13.0'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.4'
  gem 'rspec-rails', '~> 3.5'
  gem 'selenium-webdriver'
end

group :test do
  gem 'database_cleaner', '~> 1.5'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'timecop', '~> 0.9'
end
