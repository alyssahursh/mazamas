class Route < ActiveRecord::Base
  belongs_to :climb_class
  belongs_to :mountain
  has_many :climbs

  def rock_class_text
    text = ""
    if rock_class == 3
      text = "3rd Class"
    elsif rock_class == 4
      text = "4th Class"
    elsif rock_class == 5
      text = "5th Class"
    elsif typical_gear == "scramble"
      text = "Scramble"
    end
    return text
  end

  def snow_angle_text
    text = ""
    if !snow_angle.nil?
      text = "#{snow_angle.capitalize}\u00B0"
    end
    return text
  end
end
