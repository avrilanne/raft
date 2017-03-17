class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
