class Event < ApplicationRecord
  validates_presence_of :department, :event_date, :event_name, :event_description, :event_guest, :event_venue
end
