class CreateJoinTableClimbTagClimbs < ActiveRecord::Migration
  def change
    create_join_table :climb_tags, :climbs do |t|
      # t.index [:climb_tag_id, :climb_id]
      # t.index [:climb_id, :climb_tag_id]
    end
  end
end
