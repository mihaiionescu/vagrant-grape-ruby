require File.expand_path('../environment', __FILE__)

env = (ENV['RACK_ENV'].to_sym || :development)

module Dummy
  module Application
    include ActiveSupport::Configurable
  end
end

Dummy::Application.configure do |config|
  config.root = Dir.pwd
  config.env  = ActiveSupport::StringInquirer.new(env.to_s)
end

Dir[File.expand_path('../initializers/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/api/namespace.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../lib/*.rb', __FILE__)].each {|f| require f }
Dir[File.expand_path('../../app/api/v1/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/api/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/models/*.rb', __FILE__)].each {|f| require f}

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