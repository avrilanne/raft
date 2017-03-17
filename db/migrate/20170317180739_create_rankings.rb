class CreateRankings < ActiveRecord::Migration
  def change
    create_table :rankings do |t|
      t.integer :option_id, null: false
      t.integer :user_id, null: false
      t.integer :position

      t.timestamps null: false
    end
  end
end
