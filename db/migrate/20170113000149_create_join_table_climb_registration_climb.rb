class CreateJoinTableClimbRegistrationClimb < ActiveRecord::Migration
  def change
    create_join_table :registrations, :climbs do |t|
      t.index [:registration_id, :climb_id]
      t.index [:climb_id, :registration_id]
    end
  end
end
