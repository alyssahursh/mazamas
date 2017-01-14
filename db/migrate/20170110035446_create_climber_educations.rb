class CreateClimberEducations < ActiveRecord::Migration
  def change
    create_table :climber_educations do |t|
      t.integer :year
      t.string :leader

      t.timestamps null: false
    end
    add_reference :climber_educations, :education, index: true
    # add_foreign_key :climber_educations, :educations

    add_reference :climber_educations, :climber_profile, index: true
    # add_foreign_key :climber_educations, :climber_profiles
  end
end
