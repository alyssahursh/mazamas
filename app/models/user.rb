class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :user_roles
  has_many                :climb_apps
  belongs_to              :climber_profile
  belongs_to              :climb_leader_profile
  has_many :climb_leader_1s, class_name: "Climb", foreign_key:'leader_1_id'
  has_many :climb_leader_2s, class_name: "Climb", foreign_key:'leader_2_id'
  has_many :climb_assistant_1s, class_name: "Climb", foreign_key:'assistant_1_id'
  has_many :climb_assistant_2s, class_name: "Climb", foreign_key:'assistant_2_id'


  def age
    now = Time.now.utc.to_date
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end    
end
