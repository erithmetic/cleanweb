class AddReadAtToReading < ActiveRecord::Migration
  def change
    add_column :readings, :read_at, :datetime

  end
end
