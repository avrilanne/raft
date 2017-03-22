class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.boolean :dwolla_verified, default: false
      t.boolean :fine_owed, default: false
      t.string :password_digest, null: false
      t.string :account_url
      t.timestamps null: false
    end
  end
end
