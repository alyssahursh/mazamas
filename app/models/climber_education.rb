class ClimberEducation < ActiveRecord::Base
  belongs_to :user
  has_one :education
end
