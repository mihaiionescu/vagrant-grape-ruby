module Dummy::API::V1
  class Tests < ::Grape::API

    # /v1/testing endpoints
    resource :testing do
      # /v1/testing/token endpoints
      route_param :token do

        # POST /v1/testing/token endpoint.
        desc "Generate an API token and present it."
        post "/" do
          auth_token = AccessToken.create!
          present AccessToken, with: Dummy::API::V1::Entities::AccessTokenBase
        end

        # GET /v1/testing/token
        desc ""
        params do
          requires :access_token, type: String, desc: "Access Token for testing the authenticable endpoint."
        end
        get "/" do
          authenticate!
          present @current_token, with: Dummy::API::V1::Entities::AccessTokenBase
        end

      end
    end

  end
end