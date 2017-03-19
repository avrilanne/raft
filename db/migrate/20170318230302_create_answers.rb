class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :choice, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :answers, [:user_id, :choice_id], unique: true
  end
end
