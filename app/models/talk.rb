class Talk < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable

  state_machine :state, :initial => :pending do
    event :approve do
      transition :pending  => :approved
      transition :rejected => :approved
      transition :delayed  => :approved
    end

    event :reject do
      transition :pending  => :rejected
      transition :approved => :rejected
      transition :delayed  => :approved
    end

    event :delay do
      transition :pending  => :delayed
      transition :approved => :delayed
      transition :rejected => :delayed
    end
  end

end
