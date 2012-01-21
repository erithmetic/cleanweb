class AddAvatarToStudents < ActiveRecord::Migration
  def change
    change_table(:students) { |s| s.has_attached_file :avatar }
  end
end
