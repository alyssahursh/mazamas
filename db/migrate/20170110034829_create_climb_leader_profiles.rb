class CreateClimbLeaderProfiles < ActiveRecord::Migration
  def change
    create_table :climb_leader_profiles do |t|
      t.integer :climbing_since
      t.integer :leader_since
      t.integer :pace
      t.text :climb_preferences
      t.text :volunteer_history
      t.text :climb_achievements
      t.text :climb_philsophy
      t.text :summit_treat
      t.text :profile

      t.timestamps null: false
    end
  end
end
