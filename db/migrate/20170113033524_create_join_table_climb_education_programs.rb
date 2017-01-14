class CreateJoinTableClimbEducationPrograms < ActiveRecord::Migration
  def change
      create_join_table :educations, :climbs do |t|
        t.index [:education_id, :climb_id]
        t.index [:climb_id, :education_id]
      end
  end
end
