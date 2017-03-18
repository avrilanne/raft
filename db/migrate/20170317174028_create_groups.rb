class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :admin_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
