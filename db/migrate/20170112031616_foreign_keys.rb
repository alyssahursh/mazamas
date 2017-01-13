class ForeignKeys < ActiveRecord::Migration
  def change
    # Connect User and Climber Profile
    add_reference :climber_profiles, :user, index: true
    add_foreign_key :climber_profiles, :users

    add_reference :users, :climber_profile, index: true
    add_foreign_key :users, :climber_profiles

    # Connect User and Climb Leader Profile
    add_reference :climb_leader_profiles, :user, index: true
    add_foreign_key :climb_leader_profiles, :users

    add_reference :users, :climb_leader_profile, index: true
    add_foreign_key :users, :climb_leader_profiles

    # Add Mountain ID to Routes
    add_reference :routes, :mountain, index: true
    add_foreign_key :routes, :mountains

    # Add Dates to Climbs (Climb knows of date, but not other way around)
    add_reference :climbs, :specific_date, index: true
    add_foreign_key :climbs, :specific_dates

    add_reference :climbs, :general_date, index: true
    add_foreign_key :climbs, :general_dates

    # Add Route and Climb Schedule to Climbs
    add_reference :climbs, :route, index: true
    add_foreign_key :climbs, :routes

    add_reference :climbs, :climb_schedule, index: true
    add_foreign_key :climbs, :climb_schedules

    add_reference :climbs, :climb_tag, index: true
    add_foreign_key :climbs, :climb_tags

    # Add Education Programs and User to Climber Educations
    add_reference :climber_educations, :education_program, index: true
    add_foreign_key :climber_educations, :education_programs

    add_reference :climber_educations, :user, index: true
    add_foreign_key :climber_educations, :users

    # Add Climb Class to Routes
    add_reference :routes, :climb_class, index: true
    add_foreign_key :routes, :climb_classes

  end
end
