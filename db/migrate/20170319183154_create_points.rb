class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :user_id,  null: false

      t.timestamps null: false
    end
  end
end
