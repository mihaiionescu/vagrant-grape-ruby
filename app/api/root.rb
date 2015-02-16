module Dummy
  module API
    class Root < ::Grape::API
      version 'v1', using: :path, vendor: 'dummy_company'
      format :json

      mount V1::Root

      route :any, '*path' do
        not_found!
      end

    end
  end
end