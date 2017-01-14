class CreateRegistrations < ActiveRecord::Migration
  def change
    create_enum :registration_status, 'applied', 'accepted', 'rejected', 'waitlist', 'leader', 'assistant'
    create_table :registrations do |t|
      t.date :application_date

      t.timestamps null: false
    end
    add_column :registrations, :registration_status, :registration_status

    add_reference :registrations, :user, index: true
    add_foreign_key :registrations, :users

  end

end
