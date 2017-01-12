class ForeignKeys < ActiveRecord::Migration
  def change
    add_reference :climber_profiles, :user, index: true
    add_foreign_key :climber_profiles, :users

    add_reference :climb_leader_profiles, :user, index: true
    add_foreign_key :climb_leader_profiles, :users

    add_reference :routes, :mountain, index: true
    add_foreign_key :routes, :mountains

    add_reference :climbs, :specific_date, index: true
    add_foreign_key :climbs, :specific_dates

    add_reference :climbs, :general_date, index: true
    add_foreign_key :climbs, :general_dates

    add_reference :climbs, :route, index: true
    add_foreign_key :climbs, :routes

    add_reference :climber_educations, :education_program, index: true
    add_foreign_key :climber_educations, :education_programs

    add_reference :routes, :climb_class, index: true
    add_foreign_key :routes, :climb_classes
  end
end
