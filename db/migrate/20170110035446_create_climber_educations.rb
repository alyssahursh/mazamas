class CreateClimberEducations < ActiveRecord::Migration
  def change
    create_table :climber_educations do |t|
      t.integer :year
      t.string :leader

      t.timestamps null: false
    end
  end
end
