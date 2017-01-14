class User < ActiveRecord::Base
  has_and_belongs_to_many :user_roles
  has_many :registrations
  belongs_to :climber_profile
  belongs_to :climb_leader_profile
end
