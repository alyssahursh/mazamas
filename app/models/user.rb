class User < ActiveRecord::Base
  has_and_belongs_to_many :user_roles
  has_many :climber_educations
  has_one :climber_profile
  has_one :climb_leader_profile
end
