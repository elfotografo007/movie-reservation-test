require 'bundler'
env = ENV['MV_ENV'] || 'development'
Bundler.require(:default, env.to_sym)

require_relative 'database'
