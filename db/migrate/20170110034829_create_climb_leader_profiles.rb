class CreateClimbLeaderProfiles < ActiveRecord::Migration
  def change
    create_table :climb_leader_profiles do |t|
      t.integer :climbing_since
      t.integer :leader_since
      t.integer :pace
      t.text :climb_preferences
      t.text :volunteer_history
      t.text :climb_achievements
      t.text :climb_philosophy
      t.text :summit_treat
      t.text :bio
      t.text :photo_link

      t.timestamps null: false
    end
    
    add_reference :climb_leader_profiles, :user, index: true
    add_foreign_key :climb_leader_profiles, :users

  end
end
