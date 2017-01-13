class ForeignKeys < ActiveRecord::Migration
  def change
    # Connect User and Climber Profile
    add_reference :climber_profiles, :user, index: true
    add_foreign_key :climber_profiles, :users

    add_reference :users, :climber_profile, index: true
    add_foreign_key :users, :climber_profiles

    # Connect Climber Profile and Climber Experiences
    add_reference :climber_experiences, :climber_profile, index: true
    add_foreign_key :climber_experiences, :climber_profiles

    add_reference :climber_profiles, :climber_experience, index: true
    add_foreign_key :climber_profiles, :climber_experiences

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

    add_reference :specific_dates, :climb, index: true
    add_foreign_key :specific_dates, :climbs

    add_reference :climbs, :general_date, index: true
    add_foreign_key :climbs, :general_dates

    add_reference :general_dates, :climb, index: true
    add_foreign_key :general_dates, :climbs

    # Add Route and Climb Schedule to Climbs
    add_reference :climbs, :route, index: true
    add_foreign_key :climbs, :routes

    add_reference :routes, :climb, index: true
    add_foreign_key :routes, :climbs

    add_reference :climbs, :climb_schedule, index: true
    add_foreign_key :climbs, :climb_schedules

    add_reference :climbs, :climb_tag, index: true
    add_foreign_key :climbs, :climb_tags

    add_reference :climb_tags, :climb, index: true
    add_foreign_key :climb_tags, :climbs

    # Add Education Programs and User to Climber Educations
    add_reference :climber_educations, :education, index: true
    add_foreign_key :climber_educations, :educations

    add_reference :climber_educations, :user, index: true
    add_foreign_key :climber_educations, :users

    # Add Climb Class to Routes
    add_reference :routes, :climb_class, index: true
    add_foreign_key :routes, :climb_classes

    # Connect Climb and Education Programs (for preferences)
    add_reference :climbs, :education, index: true
    add_foreign_key :climbs, :educations, index: true

    add_reference :educations, :climb, index: true
    add_foreign_key :educations, :climbs, index: true
  end
end
