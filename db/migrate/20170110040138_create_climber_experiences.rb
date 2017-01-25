class CreateClimberExperiences < ActiveRecord::Migration
  def change
    create_enum :climb_type, "mazamas", "private", "other"
    create_table :climber_experiences do |t|
      t.string :mountain
      t.string :route
      t.string :role
      t.integer :year
      t.string :climb_leader

      t.timestamps null: false
    end
    add_column :climber_experiences, :climb_type, :climb_type
    add_column :climber_experiences, :month, :climb_month

  end
end
