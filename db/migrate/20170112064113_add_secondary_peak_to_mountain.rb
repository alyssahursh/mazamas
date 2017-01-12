class AddSecondaryPeakToMountain < ActiveRecord::Migration
  def change
    add_column :routes, :secondary_peak, :integer
  end
end
