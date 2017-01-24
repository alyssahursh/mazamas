class ClimberEducation < ActiveRecord::Base
  belongs_to :climber_profile
  belongs_to :education
  belongs_to :education_leader,    class_name: 'User'
end
