class Route < ActiveRecord::Base
  belongs_to :climb_class
  belongs_to :mountain
  has_many :climbs
end
