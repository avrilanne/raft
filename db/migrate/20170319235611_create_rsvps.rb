class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.boolean :present, default: false

      t.timestamps null: false
    end
  end
end
