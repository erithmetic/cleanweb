class AddSquareFootageToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :square_footage, :float

  end
end
