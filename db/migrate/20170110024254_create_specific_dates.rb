class CreateSpecificDates < ActiveRecord::Migration
  def change
    create_table :specific_dates do |t|
      t.date :date_leave_town
      t.date :date_leave_trailhead
      t.date :date_summit
      t.date :date_return_trailhead
      t.date :date_return_town

      t.timestamps null: false
    end
  end
end
