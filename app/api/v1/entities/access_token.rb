module Dummy::API::V1::Entities
  class AccessTokenBase < ::Grape::Entity
    expose :id, :token
  end
end