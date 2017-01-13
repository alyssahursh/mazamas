class CreateJoinTableClimbGradEmphasesClimbs < ActiveRecord::Migration
  def change
    create_join_table :grad_prefs, :climbs do |t|
      t.index [:grad_pref_id, :climb_id]
      t.index [:climb_id, :grad_pref_id]
    end
  end
end
