class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :title
      t.datetime :published_at
      t.references :poll, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
