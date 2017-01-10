class CreateClimbRegistrations < ActiveRecord::Migration
  def change
    create_enum :registration_status, 'applied' 'accepted' 'rejected' 'waitlist' 'leader' 'assistant'
    create_table :climb_registrations do |t|
      t.date :application_date

      t.timestamps null: false
    end
    add_column :climb_registrations, :registration_status, :registration_status
  end
end
