class Talk < ActiveRecord::Base
  belongs_to :user

  scope :proposed, -> { where(presented: false) }
  scope :presented, -> { where(presented: true) }
end
