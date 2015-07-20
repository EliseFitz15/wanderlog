require 'rails_helper'

RSpec.describe Highlight, type: :model do
  it { should belong_to(:trip) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:location_name) }
  it { should validate_length_of(:location_name) }
  it { should validate_length_of(:memory) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
