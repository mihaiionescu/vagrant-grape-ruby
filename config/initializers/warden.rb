Warden::Strategies.add(:api_token) do
  def valid?
    params['access_token']
  end

  def authenticate!
    instance = AccessToken.find_by_token(params['access_token'].to_s)
    instance.nil? ? fail : success!(instance)
  end
end

class FailureApp
  def self.call(env)
    new.call(env)
  end

  def call(env)
    body = '{"status":{"code":401,"message":"Invalid, missing or expired token"}}'
    headers = {'Content-Type' => 'application/json'}
    [401, headers, [body]]
  end
end