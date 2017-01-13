class AddColumnToClimbLeaders < ActiveRecord::Migration
  def change
    add_column :climb_leader_profiles, :photo_link, :string
    add_column :climb_leader_profiles, :bio, :string
    remove_column :climb_leader_profiles, :profile, :string
  end
end
