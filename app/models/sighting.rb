class Sighting < ApplicationRecord
    belongs_to :animal
    validates_presence_of :animal unless :nested 
    attr_accessor :nested
    validates :latitude, :longitude, :date, presence: true
end
