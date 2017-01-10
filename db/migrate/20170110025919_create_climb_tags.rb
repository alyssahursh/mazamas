class CreateClimbTags < ActiveRecord::Migration
  def change
    create_table :climb_tags do |t|
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
