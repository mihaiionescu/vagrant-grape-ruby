require File.expand_path('../environment', __FILE__)

Dir[File.expand_path('../initializers/*.rb', __FILE__)].each {|f| require f}

Dir[File.expand_path('../../app/api/v1/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/api/*.rb', __FILE__)].each {|f| require f}
Dir[File.expand_path('../../app/models/*.rb', __FILE__)].each {|f| require f}

ApplicationServer = Rack::Builder.new {
  map "/" do
    # run API
    run Dummy::API::Root
  end
}