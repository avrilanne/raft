class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :location
      t.string :date
      t.string :time
      t.integer :host_id
      t.string :name

      t.timestamps null: false
    end
  end
end
