class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :name
      t.string :description
      t.string :trailhead_coordinates

      t.timestamps null: false
    end
  end
end
