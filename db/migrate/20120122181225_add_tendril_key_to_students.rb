class AddTendrilKeyToStudents < ActiveRecord::Migration
  def change
    add_column :students, :tendril_key, :string

  end
end
