class Dummy::API::Root < ::Grape::API
  version 'v1', using: :path, vendor: 'dummy_company'
  format :json
  helpers Dummy::API::Helpers

  mount Dummy::API::V1::Root

  route :any, '*path' do
    not_found!
  end
end