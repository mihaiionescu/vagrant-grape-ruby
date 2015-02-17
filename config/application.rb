require File.expand_path('../environment', __FILE__)

env = (ENV['RACK_ENV'] || :development).to_sym

module Dummy
  module Application
    include ActiveSupport::Configurable
  end
end

Dummy::Application.configure do |config|
  config.root = Dir.pwd
  config.env  = ActiveSupport::StringInquirer.new(env.to_s)
end

require_all File.expand_path('../initializers', __FILE__)
require_all File.expand_path('../../lib', __FILE__)
require_all File.expand_path('../../app/api', __FILE__)
require_all File.expand_path('../../app/models', __FILE__)

ApplicationServer = Rack::Builder.new {
  
  use Warden::Manager do |manager|
    manager.default_strategies :api_token
    manager.failure_app = FailureApp
  end

  map "/" do
    # run API
    run Dummy::API::Root
  end
}