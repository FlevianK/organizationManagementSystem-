class Service < ApplicationRecord
  validates_presence_of :service_date, :total_new_coverts, :total_attendants, :sunday_school_teachers
end
