module TokenGenerator

  def generate_friendly_token
    loop do
      token = SecureRandom.base64(16).tr('/=', '-_ ').strip.delete("\n")
      break token unless AccessToken.find_by_token(token)
    end
  end

end