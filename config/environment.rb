require File.expand_path('../boot', __FILE__)

env = (ENV['RACK_ENV'] || :development).to_sym

require 'bundler'
Bundler.require :default, env.to_sym
