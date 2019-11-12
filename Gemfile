# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.6.3"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sequel', '~> 5.26'
gem 'pg', '~> 1.1', '>= 1.1.4'
gem 'dry-transaction', '~> 0.13.0'
gem 'grape', '~> 1.2', '>= 1.2.4'

group :development, :test do
    gem 'byebug', '~> 11.0', '>= 11.0.1'
    gem 'rspec', '~> 3.9'
    gem 'faker', '~> 2.7'
    gem 'factory_bot', '~> 5.1', '>= 5.1.1'
end
