class CreateEducationPrograms < ActiveRecord::Migration
  def change
    create_table :education_programs do |t|
      t.string :abbreviation
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
