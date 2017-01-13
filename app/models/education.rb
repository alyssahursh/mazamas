class Education < ActiveRecord::Base
  belongs_to :climber_education
  has_and_belongs_to_many :climbs
end
