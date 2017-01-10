class CreateMountains < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :peak_coordinates

      t.timestamps null: false
    end
  end
end
