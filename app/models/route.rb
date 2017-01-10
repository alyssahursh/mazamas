class Route < ActiveRecord::Base
  has_one :climb_class
  belongs_to :mountain
end
