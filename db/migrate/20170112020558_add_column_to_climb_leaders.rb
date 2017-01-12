class AddColumnToClimbLeaders < ActiveRecord::Migration
  def change
    add_column :climb_leader_profiles, :photo_link, :string
  end
end
