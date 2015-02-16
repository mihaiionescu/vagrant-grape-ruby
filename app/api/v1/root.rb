module Dummy
  module API
    module V1
      class Root < ::Grape::API
        format :json


        get "/ping" do
          {
            status: 201,
            message: "YOU MADE IT !!!"
          }
        end

      
      end
    end
  end
end