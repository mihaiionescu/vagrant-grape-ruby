class Dummy::API::V1::Root < ::Grape::API
  format :json

  get "/ping" do
    {
      status: 201,
      message: "YOU MADE IT !!!"
    }
  end

  get "/ping_auth" do
    env["warden"].authenticate!
    'authenticated endpoint'
  end
end