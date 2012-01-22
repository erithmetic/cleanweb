class AddDeviceIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :device_id, :string

  end
end
