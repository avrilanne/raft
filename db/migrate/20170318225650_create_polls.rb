class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :question
      t.integer :event_id
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
