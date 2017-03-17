class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.string :date
      t.string :time
      t.integer :group_id
      t.integer :host_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
