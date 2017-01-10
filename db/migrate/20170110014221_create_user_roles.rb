class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles do |t|
      t.string :role
      t.string :description

      t.timestamps null: false
    end
  end
end
