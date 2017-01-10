class CreateClimberProfiles < ActiveRecord::Migration
  def change
    create_table :climber_profiles do |t|
      t.text :bio
      t.text :volunteer_history
      t.text :physical_conditioning
      t.text :medical_condition
      t.text :medication

      t.timestamps null: false
    end
  end
end
