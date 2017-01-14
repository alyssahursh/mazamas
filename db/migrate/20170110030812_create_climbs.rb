class CreateClimbs < ActiveRecord::Migration
  def change
    create_enum :climb_status, 'unpublished', 'open', 'full', 'waitlist', 'cancelled', 'completed'
    create_table :climbs do |t|
      t.text :description
      t.integer :party_size
      t.integer :spots_available
      t.datetime :last_updated

      t.timestamps null: false
    end
    add_column :climbs, :climb_status, :climb_status

    add_reference :climbs, :route, index: true
    add_foreign_key :climbs, :routes

    add_reference :climbs, :climb_schedule, index: true
    add_foreign_key :climbs, :climb_schedules

    add_reference :climbs, :climb_tag, index: true
    add_foreign_key :climbs, :climb_tags

    add_reference :climbs, :leader_1, index: true
    # add_foreign_key :climbs, :users

    add_reference :climbs, :leader_2, index: true
    # add_foreign_key :climbs, :users

    add_reference :climbs, :assistant_1, index: true
    # add_foreign_key :climbs, :users

    add_reference :climbs, :assistant_2, index: true
    # add_foreign_key :climbs, :users

    add_reference :registrations, :climb, index: true
    # add_foreign_key :registrations, :climbs

    add_reference :specific_dates, :climb, index: true
    add_foreign_key :specific_dates, :climbs

    add_reference :general_dates, :climb, index: true
    add_foreign_key :general_dates, :climbs


  end
end
