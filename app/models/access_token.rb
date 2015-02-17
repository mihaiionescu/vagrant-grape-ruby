class AccessToken < ActiveRecord::Base
  include TokenGenerator

  before_create :generate_token

  private
    def generate_token
      binding.pry
      self.token = generate_friendly_token
    end
end