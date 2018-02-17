class User < ActiveRecord::Base
  has_many :talks

  validates :email, uniqueness: true, presence: true
  validates_format_of :email,with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  scope :admins, -> { where(admin: true) }

  def avatar
    GravatarAddress.address_for_email email
  end
end
