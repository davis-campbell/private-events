class User < ActiveRecord::Base
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :attended_events, :through => :event_attendings
  has_many :event_attendings, :foreign_key => "attendee_id"
  
  def upcoming_events
    self.attended_events.upcoming
  end
  
  def past_events
    self.attended_events.past
  end

end
