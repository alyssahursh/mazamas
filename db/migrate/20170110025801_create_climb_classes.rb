class CreateClimbClasses < ActiveRecord::Migration
  def change
    create_table :climb_classes do |t|
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
