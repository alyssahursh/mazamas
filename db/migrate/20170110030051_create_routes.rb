class CreateRoutes < ActiveRecord::Migration
  def change
    create_enum :snow_angle, 'notapplicable', '35to50', 'over50', 'upto35'
    create_enum :typical_gear, 'snow', 'scramble', 'rock', 'rockandsnow'
    create_enum :typical_season, 'springsummer', 'summerautumn'
    create_table :routes do |t|
      t.string  :name
      t.string  :elevation_gain
      t.integer :driving_distance
      t.float   :driving_time
      t.integer :typical_duration
      t.boolean :glaciated_peak
      t.integer :rock_class
      t.boolean :rappelling
      t.boolean :crevasse_rescue
      t.text    :notes
      t.text    :guidebooks
      t.text    :phone_numbers
      t.integer :secondary_peak


      t.timestamps null: false
    end
    add_column :routes, :snow_angle, :snow_angle
    add_column :routes, :typical_gear, :typical_gear
    add_column :routes, :typical_season, :typical_season

    add_reference :routes, :climb_class, index: true
    add_foreign_key :routes, :climb_classes

    add_reference :routes, :mountain, index: true
    add_foreign_key :routes, :mountains
  end
end
