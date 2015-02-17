require File.expand_path('../environment', __FILE__)

Dir[File.expand_path('../initializers/*.rb', __FILE__)].each {|f| require f}

Dir[File.expand_path('../../app/api/v1/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/api/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/models/*.rb', __FILE__)].each {|f| require f}

ApplicationServer = Rack::Builder.new {
  use Rack::Session::Cookie, :secret => ENV['SESSION_SECRET']
  
  use Warden::Manager do |manager|
    manager.default_strategies :api_token
    manager.failure_app = FailureApp
  end

  map "/" do
    # run API
    run Dummy::API::Root
  end
}