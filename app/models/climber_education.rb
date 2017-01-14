class ClimberEducation < ActiveRecord::Base
  belongs_to :climber_profile
  belongs_to :education
end
