class Climb < ActiveRecord::Base
  has_many                  :climb_registrations
  has_and_belongs_to_many   :climb_grad_emphases
  has_and_belongs_to_many   :climb_tags
  belongs_to                :climb_schedule
  has_one                   :specific_date
  has_one                   :general_date
  has_one                   :route
end
