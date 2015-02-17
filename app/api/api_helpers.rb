module Dummy::API::Helpers
  def authenticate!
    at = warden.authenticate!
    @current_token ||= at
  end

  def warden
    env['warden']
  end

  def current_token
    authenticate! if @current_token.blank?
  end

  def not_found!
    error! data(404, 'Not found'), 404
  end

  def data(code, message)
    { status: { code: code, message: message } }
  end
end