class Climb < ActiveRecord::Base
  has_many                  :climb_apps
  has_and_belongs_to_many   :educations
  has_and_belongs_to_many   :climb_tags
  belongs_to                :climb_schedule
  has_one                   :specific_date
  has_one                   :general_date
  belongs_to                :route
  belongs_to                :leader_1,    class_name: 'User'
  belongs_to                :leader_2,    class_name: 'User'
  belongs_to                :assistant_2, class_name: 'User'
  belongs_to                :assistant_1, class_name: 'User'

  has_one       :mountain,      through: :route
  has_one       :climb_class,   through: :route
  has_one       :climb_class,   through: :route


  def spots_available
    occupied = climb_apps.where(climb_app_status: 'accepted').length

    !leader_1.nil? ? occupied += 1 : nil
    !leader_2.nil? ? occupied += 1 : nil
    !assistant_1.nil? ? occupied += 1 : nil
    !assistant_2.nil? ? occupied += 1 : nil

    available = party_size - occupied
  end

  def date_text
    text = ""
    if !specific_date.nil?
      if specific_date.date_leave_town.strftime('%m-%d-%Y') == specific_date.date_return_town.strftime('%m-%d-%Y')
        text = specific_date.date_leave_town.strftime('%m-%d-%Y')
      else
        text = "#{specific_date.date_leave_town.strftime('%m-%d-%Y')} to #{specific_date.date_return_town.strftime('%m-%d-%Y')}"
      end
    else
      text = "#{general_date.month} #{general_date.year}"
    end
    return text
  end
end
