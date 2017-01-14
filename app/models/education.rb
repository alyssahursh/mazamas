class Education < ActiveRecord::Base
  has_many :climber_education
  has_and_belongs_to_many :climbs
end
