class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :winner_id
      t.datetime :pencils_down_at

      t.timestamps
    end
  end
end
