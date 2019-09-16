require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should have_many(:leaders).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:contacts) }
  it { should validate_presence_of(:residence) }
  it { should validate_presence_of(:join_date) }
  it { should validate_presence_of(:departments) }
end
