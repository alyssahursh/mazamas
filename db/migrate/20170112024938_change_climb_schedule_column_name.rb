class ChangeClimbScheduleColumnName < ActiveRecord::Migration
  def change
    add_column :climb_schedules, :year, :integer
    remove_column :climb_schedules, :date, :integer
  end
end
