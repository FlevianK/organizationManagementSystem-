require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should validate_presence_of(:service_date) }
  it { should validate_presence_of(:total_attendants) }
  it { should validate_presence_of(:total_new_converts) }
  it { should validate_presence_of(:sunday_school_teachers) }
end
