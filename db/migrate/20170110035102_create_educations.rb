class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :abbreviation
      t.string :name
      t.string :description

      t.timestamps null: false
    end

  end
end
