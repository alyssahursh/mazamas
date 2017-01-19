class CreateRoutes < ActiveRecord::Migration
  def change
    create_enum :snow_angle, 'not applicable', '35 to 50', 'over 50', 'up to 35'
    create_enum :typical_gear, 'snow', 'scramble', 'rock', 'rock and snow'
    create_enum :typical_season, 'spring summer', 'summer autumn'
    create_table :routes do |t|
      t.string  :name
      t.string  :elevation_gain
      t.integer :typical_duration
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
