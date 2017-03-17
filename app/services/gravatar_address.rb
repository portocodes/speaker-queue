require 'digest/md5'

class GravatarAddress
  def self.address_for_email email
    hash = Digest::MD5.hexdigest(email.downcase)

    "https://www.gravatar.com/avatar/#{hash}"
  end
end
