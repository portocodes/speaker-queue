class Talk < ActiveRecord::Base
  belongs_to :user
  acts_as_taggable
  nilify_blanks :only => [:video, :resource, :talk_date, :talk_time]
  attr_accessor :talk_date, :talk_time
  after_initialize :get_datetimes
  before_validation :set_datetimes

  MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'].freeze

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

  def get_datetimes
    self.time_event ||= Time.now
    self.talk_date ||= self.time_event.to_date.to_s(:db)
    self.talk_time ||= "#{'%02d' % self.time_event.hour}:#{'%02d' % self.time_event.min}"
  end

  def set_datetimes
    self.time_event = "#{self.talk_date} #{self.talk_time}:00"
  end
end
