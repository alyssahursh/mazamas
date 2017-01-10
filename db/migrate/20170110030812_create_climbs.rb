class CreateClimbs < ActiveRecord::Migration
  def change
    create_table :climbs do |t|
      t.text :description
      t.integer :party_size
      t.integer :spots_available
      t.datetime :last_updated

      t.timestamps null: false
    end
  end
end
