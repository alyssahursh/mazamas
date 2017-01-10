class CreateClimbGradEmphases < ActiveRecord::Migration
  def change
    create_table :climb_grad_emphases do |t|
      t.string :code
      t.string :description

      t.timestamps null: false
    end
  end
end
