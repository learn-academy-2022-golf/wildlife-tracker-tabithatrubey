require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid if it does not include latitude' do
    sighting = Sighting.create longitude: 134252353, date:2022-12-13
    expect(sighting.errors[:latitude]).to_not be_empty
  end
  it 'is not valid if it does not include longitude' do
    sighting = Sighting.create latitude: 456366272, date:2022-12-13
    expect(sighting.errors[:longitude]).to_not be_empty
  end
  it 'is not valid if it does not include date' do
    sighting = Sighting.create latitude: 456362589972, longitude:25827527525
    expect(sighting.errors[:date]).to_not be_empty
  end
end
