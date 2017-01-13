class Climb < ActiveRecord::Base
  has_many                  :registrations
  has_and_belongs_to_many   :educations
  belongs_to                :climb_tags
  belongs_to                :climb_schedule
  has_one                   :specific_date
  has_one                   :general_date
  has_one                   :route
end
