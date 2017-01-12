class AddColumnsToMountains < ActiveRecord::Migration
  def change
    add_column :mountains, :latitude, :string
    add_column :mountains, :longitude, :string
    add_column :mountains, :state, :string
    add_column :mountains, :country, :string
    add_column :mountains, :continent, :string
    add_column :mountains, :summit_post_url, :string
    add_column :mountains, :google_maps_url, :string
    add_column :mountains, :elevation_feet, :string
    add_column :mountains, :elevation_meters, :string
    add_column :mountains, :summit_post_name, :string
    remove_column :mountains, :peak_coordinates, :string
  end
end
