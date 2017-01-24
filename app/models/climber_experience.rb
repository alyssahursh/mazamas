class ClimberExperience < ActiveRecord::Base
  belongs_to :climber_profile
  belongs_to :climb_leader,    class_name: 'User'

end
