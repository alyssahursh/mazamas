class Mountain < ActiveRecord::Base
  has_many :routes


  def map_zoom
    if !elevation_feet.nil?
      elevation = elevation_feet.gsub(",","").to_i
    else
      elevation = 0
    end

    if elevation < 8000
      level = 14
    else
      level = 12
    end
    return level
  end

  def latitude_offset
    offset = 0
    if map_zoom == 14
      offset = 0.0035
    elsif map_zoom == 12
      offset = 0.015
    end
    return offset
  end

  def longitude_offset
    offset = 0
    if map_zoom == 14
      offset = 0.014
    elsif map_zoom == 12
      offset = 0.055
    end
    return offset
  end


  def route_types
    types = []
    routes.each do |route|
      types << route.typical_gear
    end
    return types.uniq
  end

  def route_headers
    headers = []
    type_list = route_types
    if type_list.include? "rock"
      headers << "ROCK"
    end

    if type_list.include? "snow"
      headers << "SNOW"
    end

    if type_list.include? "rock and snow"
      headers = ["ROCK", "SNOW"]
    end

    return headers
  end

  def class_ordered_routes
    routes.order("climb_class_id")
  end

  def driving_text
    text = ""
    if !driving_distance.nil? && !driving_time.nil?
      text = "#{driving_distance} miles, #{driving_time} hours from Portland"
    elsif !driving_distance.nil?
      text = "#{driving_distance} miles from Portland"
    elsif !driving_time.nil?
      text = "#{driving_time} miles from Portland"
    end
    return text
  end

  def elevation_text
    text = ""
    if !elevation_feet.nil?
      number = elevation_feet.to_s.insert(-4,",")
      text = "#{number} feet"
    end
    return text
  end


  # def geo_json()
  #   geo_json = []
  #   geo_json << {
  #     type: "Feature",
  #     geometry: {
  #       type: "Point",
  #       coordinates: [mountain.longitude, mountain.latitude]
  #     },
  #     properties: {
  #       title: mountain.name,
  #       :"marker-color" => "#FFFFFF",
  #       :"marker-symbol" => "circle",
  #       :"marker-size" => "medium",
  #     }
  #   }
  # end
end
