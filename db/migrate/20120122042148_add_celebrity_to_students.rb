class AddCelebrityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :celebrity, :boolean
  end
end
