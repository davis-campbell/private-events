class Event < ActiveRecord::Base
  scope :upcoming, -> { where("Date >= ?", Date.today) }
  scope :past, -> { where("Date < ?", Date.today) }
  belongs_to :creator, :class_name => "User"
  #before_create { self.date = 3.days.ago}
  has_many :attendees, :through => :event_attendings
  has_many :event_attendings, :foreign_key => "attended_event_id"
  
end
