class Climb < ActiveRecord::Base
  has_many                  :registrations
  has_and_belongs_to_many   :educations
  belongs_to                :climb_tag
  belongs_to                :climb_schedule
  has_one                   :specific_date
  has_one                   :general_date
  belongs_to                :route
  has_one       :mountain,      through: :route
  has_one       :climb_class,   through: :route
  has_one       :climb_class,   through: :route

  def leader
    leader_reg = registrations.find_by(registration_status: 'leader')
    leader = User.find(leader_reg.user)
  end

  def spots_available
    occupied = registrations.where(registration_status: 'accepted').length
    occupied += registrations.where(registration_status: 'leader').length
    occupied += registrations.where(registration_status: 'assistant').length
    
    available = party_size - occupied
  end

end
