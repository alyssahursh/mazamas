class CreateClimbApps < ActiveRecord::Migration
  def change
    create_enum :climb_app_status, 'applied', 'accepted', 'rejected', 'waitlist'
    create_table :climb_apps do |t|
      t.date :application_date

      t.timestamps null: false
    end
    add_column :climb_apps, :climb_app_status, :climb_app_status

    add_reference :climb_apps, :user, index: true
    add_foreign_key :climb_apps, :users

  end

end
