require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid if it does not include a scientific_binomial' do
    badger = Animal.create common_name: 'Badger'
    expect(badger.errors[:scientific_binomial]).to_not be_empty
  end
  it 'is not valid if it does not include a common_name' do
    badger = Animal.create scientific_binomial: 'Taxidea taxus'
    expect(badger.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if the common_name is not unique' do
    Animal.create(common_name: 'Whale', scientific_binomial: "Orca")
    whale = Animal.create(common_name: 'Whale', scientific_binomial: "Orca")
    expect(whale.errors[:common_name]).to_not be_empty
  end
  it 'is not valid if the scientific_binomial is not unique' do
    Animal.create(common_name: 'Whale', scientific_binomial: "Orca")
    whale = Animal.create(common_name: 'Whale', scientific_binomial: "Orca")
    expect(whale.errors[:scientific_binomial]).to_not be_empty
  end
  it 'is not valid if the scientific_binomial exactly matches the common_name' do
    Animal.create(common_name: 'Whale', scientific_binomial: "Whale")
    whale = Animal.create(common_name: 'Whale', scientific_binomial: "Whale")
    expect(whale.errors[:scientific_binomial]).to_not be_empty
    expect(whale.errors[:common_name]).to_not be_empty
  end
end
