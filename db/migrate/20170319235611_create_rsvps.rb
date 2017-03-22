class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false
      t.boolean :present, default: true
      #changed to present being default
      t.timestamps null: false
    end
  end
end
