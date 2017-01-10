class CreateJoinTableUserRolesUsers < ActiveRecord::Migration
  def change
    create_join_table :user_roles, :users do |t|
      # t.index [:user_role_id, :user_id]
      # t.index [:user_id, :user_role_id]
    end
  end
end
