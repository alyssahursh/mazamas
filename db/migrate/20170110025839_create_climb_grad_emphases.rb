class CreateClimbGradEmphases < ActiveRecord::Migration
  def change
    create_table :grad_prefs do |t|
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
