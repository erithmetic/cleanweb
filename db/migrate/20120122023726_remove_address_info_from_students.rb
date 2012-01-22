class RemoveAddressInfoFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :address
    remove_column :students, :city
    remove_column :students, :state
    remove_column :students, :zip
  end

  def down
  end
end
