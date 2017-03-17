class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :group_id, null: false
      t.integer :user_id, null: false
      t.string :fee
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
