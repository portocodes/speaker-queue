class LoginToken
  def self.generate email
    payload = JSON.dump(e: email, ts: 1.day.from_now.utc.to_i)
    StatelessToken.new.encode(payload)
  end

  def self.validate token
    payload = JSON.load(StatelessToken.new.decode(token))

    Time.now.utc.to_i <= payload["ts"] && payload["e"]
  rescue
    false
  end
end
