class CreateTestTakers < ActiveRecord::Migration
  def change
    create_table :test_takers do |t|
      t.integer :student_id
      t.integer :exam_id

      t.timestamps
    end
  end
end
