class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.timestamps

      t.timestamps
    end
  end
end
