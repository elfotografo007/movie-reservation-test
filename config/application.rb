require 'bundler'
env = ENV['MV_ENV'] || 'development'
Bundler.require(:default, env.to_sym)

require_relative 'database'
Dir[File.expand_path("../../app/**/*.rb" , __FILE__)].each { |file|
  require file
}