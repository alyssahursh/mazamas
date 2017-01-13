class Climbs < ActiveRecord::Migration
  def change
    create_enum :climb_status, 'unpublished', 'open', 'full', 'waitlist', 'cancelled', 'completed'
    add_column :climbs, :climb_status, :climb_status
  end
end
