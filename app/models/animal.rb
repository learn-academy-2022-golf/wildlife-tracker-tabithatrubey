class Animal < ApplicationRecord
    has_many :sightings
    accepts_nested_attributes_for :sightings

    validates :scientific_binomial, :common_name, presence: true
    validates :scientific_binomial, comparison: {other_than: :common_name}
    validates :common_name, :scientific_binomial, uniqueness: true

end
