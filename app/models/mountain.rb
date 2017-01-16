class Mountain < ActiveRecord::Base
  has_many :routes


  def map_zoom
    if elevation_feet.to_i < 8000
      level = 14
    else
      level = 12
    end

    return level

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
