class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :state
      t.string :country
      t.string :continent
      t.string :summit_post_url
      t.string :google_maps_url
      t.string :elevation_feet
      t.string :elevation_meters
      t.string :summit_post_name

      t.timestamps null: false
    end
  end
end
