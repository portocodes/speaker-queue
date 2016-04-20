class User < ActiveRecord::Base
  has_many :talks
  ROLES = ["admin", "moderator", "coder"].freeze

  mount_uploader :avatar, AvatarUploader

  validates :email, uniqueness: true, presence: true
  validates_format_of :email,with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  accepts_nested_attributes_for :talks

end
