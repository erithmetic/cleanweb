class AddGpaToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :gpa, :float
  end
end
