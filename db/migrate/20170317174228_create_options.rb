class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id
      t.string :op_content

      t.timestamps null: false
    end
  end
end
