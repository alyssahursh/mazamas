class CreateUsers < ActiveRecord::Migration
  def change
    create_enum :membership_status, 'nonmember', 'active', 'lapsed'
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :emergency_contact
      t.string :emergency_phone
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.date :birthdate
      t.integer :age

      t.timestamps null: false
    end
    add_column :users, :membership_status, :membership_status

    add_reference :users, :climber_profile, index: true
    # add_foreign_key :users, :climber_profiles

    add_reference :users, :climb_leader_profile, index: true
    # add_foreign_key :users, :climb_leader_profiles
    
  end
end
