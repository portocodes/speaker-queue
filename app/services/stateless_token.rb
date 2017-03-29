class StatelessToken
  def initialize secret=ENV['STATELESS_TOKEN_SECRET']
    @secret = secret
  end

  def encode payload
    data = Base64.urlsafe_encode64(payload, padding: false)

    hmac = hmacify data

    [data, hmac].join '.'
  end

  def decode payload
    data, hmac = payload.split '.'

    hmac2 = hmacify data

    if hmac != hmac2
      raise ArgumentError
    end

    Base64.urlsafe_decode64(data)
  end

  def hmacify b64data
    digest = OpenSSL::Digest.new('sha256')

    OpenSSL::HMAC.hexdigest(digest, @secret, b64data)
  end
end
