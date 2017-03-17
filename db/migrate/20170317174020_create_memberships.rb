class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :raft_id
      t.integer :user_id
      t.string :fee
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
