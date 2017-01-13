class AddColumnsToRoutes < ActiveRecord::Migration
  def change
    create_enum :snow_angle, 'notapplicable', '35to50', 'over50', 'upto35'
    create_enum :typical_gear, 'snow', 'scramble', 'rock', 'rockandsnow'
    create_enum :typical_season, 'springsummer', 'summerautumn'

    add_column :routes, :elevation_gain, :string
    add_column :routes, :driving_distance, :integer
    add_column :routes, :driving_time, :float
    add_column :routes, :typical_duration, :integer
    add_column :routes, :typical_season, :typical_season
    add_column :routes, :glaciated_peak, :boolean
    add_column :routes, :rock_class, :integer
    add_column :routes, :rappelling, :boolean
    add_column :routes, :crevasse_rescue, :boolean
    add_column :routes, :notes, :text
    add_column :routes, :guidebooks, :text
    add_column :routes, :phone_numbers, :text

    add_column :routes, :snow_angle, :snow_angle
    add_column :routes, :typical_gear, :typical_gear

    remove_column :routes, :trailhead_coordinates, :string
    remove_column :routes, :description, :string
  end
end
