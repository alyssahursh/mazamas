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
    add_reference :climber_profiles, :user, index: true
    add_foreign_key :climber_profiles, :users

    add_reference :climber_experiences, :climber_profile, index: true
    add_foreign_key :climber_experiences, :climber_profiles

    add_reference :climber_educations, :climber_profile, index: true
    add_foreign_key :climber_educations, :climber_profiles

  end
end
