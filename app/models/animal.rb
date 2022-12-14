class Animal < ApplicationRecord
    has_many :sightings

    validates :scientific_binomial, :common_name, presence: true
    validates :common_name, :scientific_binomial, uniqueness: true

end
