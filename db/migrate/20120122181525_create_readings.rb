class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :address_id
      t.float :amount

      t.timestamps
    end
  end
end
