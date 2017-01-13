class CreateGeneralDates < ActiveRecord::Migration
  def change
    create_enum :climb_month, 'january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'
    create_table :general_dates do |t|
      t.integer :climb_year
      t.text :description

      t.timestamps null: false
    end
    add_column :general_dates, :climb_month, :climb_month
  end
end
