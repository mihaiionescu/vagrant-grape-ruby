desc "API Routes"
task :routes do
  Dummy::API::V1::Root.routes.each do |api|
    method = api.route_method.ljust(10)
    path = api.route_path
    puts "     #{method} #{path}"
  end
end