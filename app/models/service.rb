class Service < ApplicationRecord
  validates_presence_of :service_date, :total_new_converts, :total_attendants, :sunday_school_teachers
end
