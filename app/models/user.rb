class User < ActiveRecord::Base
  has_and_belongs_to_many :user_roles
  has_many                :registrations
  belongs_to              :climber_profile
  belongs_to              :climb_leader_profile
  has_many :climb_leader_1s, class_name: "Climb", foreign_key:'leader_1_id'
  has_many :climb_leader_2s, class_name: "Climb", foreign_key:'leader_2_id'
  has_many :climb_assistant_1s, class_name: "Climb", foreign_key:'assistant_1_id'
  has_many :climb_assistant_2s, class_name: "Climb", foreign_key:'assistant_2_id'

end
