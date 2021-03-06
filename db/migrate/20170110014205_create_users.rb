class CreateUsers < ActiveRecord::Migration
  def change
    create_enum :membership_status, 'nonmember', 'active', 'lapsed'
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
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
      t.integer :credits
      t.string :stripe_id
      t.string :subscription_id
      t.boolean :autorenew
      t.date :membership_expiration

      t.timestamps null: false
    end
    add_column :users, :membership_status, :membership_status

  end
end
