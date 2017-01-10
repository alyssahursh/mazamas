class CreateJoinTableClimbGradEmphasesClimbs < ActiveRecord::Migration
  def change
    create_join_table :climb_grad_emphases, :climbs do |t|
      # t.index [:climb_grad_emphasis_id, :climb_id]
      # t.index [:climb_id, :climb_grad_emphasis_id]
    end
  end
end
