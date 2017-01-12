class ForeignKeyMountainForRoute < ActiveRecord::Migration
  def change
    add_reference :mountains, :route, index: true
    add_foreign_key :mountains, :routes

    add_reference :climb_classes, :route, index: true
    add_foreign_key :climb_classes, :routes
  end
end
