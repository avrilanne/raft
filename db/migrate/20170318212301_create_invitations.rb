class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :group_id
      t.string :message

      t.timestamps
    end
  end
end
