require 'rails_helper'

RSpec.describe Tithe, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:member) }
  it { should validate_presence_of(:tithe_date) }
  it { should validate_presence_of(:contacts) }
end
