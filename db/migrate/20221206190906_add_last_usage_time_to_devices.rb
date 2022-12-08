class AddLastUsageTimeToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :last_usage_time, :datetime
    add_index :devices, :device_id, unique: true
  end
end
