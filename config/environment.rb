require File.expand_path('../boot', __FILE__)

env = (ENV['RACK_ENV'] || :development)

require 'bundler'
Bundler.require :default, env.to_sym

module Dummy
 module Application
   include ActiveSupport::Configurable
  end

  module API
    module V1
    end
  end
end

Dummy::Application.configure do |config|
  config.root = Dir.pwd
  config.env  = ActiveSupport::StringInquirer.new(env.to_s)
end