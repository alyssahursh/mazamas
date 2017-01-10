class ClimberProfile < ActiveRecord::Base
  has_many :climber_experiences
  belongs_to :user
  has_many :climber_educations, through: :user
end
