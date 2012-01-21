class AddFacebookInfoToStudents < ActiveRecord::Migration
  def change
    add_column :students, :name, :string
    add_column :students, :address, :string
    add_column :students, :city, :string
    add_column :students, :state, :string
    add_column :students, :zip, :string
  end
end
