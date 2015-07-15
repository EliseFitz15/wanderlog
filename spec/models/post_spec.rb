require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:trip) }
  it { should validate_presence_of(:headline) }
  it { should validate_length_of(:headline) }
  it { should validate_presence_of(:content) }
  it { should validate_length_of(:content) }
end
