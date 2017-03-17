class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id, null: false
      t.string :op_content, null: false

      t.timestamps null: false
    end
  end
end
