require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:department) }
  it { should validate_presence_of(:event_date) }
  it { should validate_presence_of(:event_name) }
  it { should validate_presence_of(:event_description) }
  it { should validate_presence_of(:event_guest) }
  it { should validate_presence_of(:event_venue) }
end
