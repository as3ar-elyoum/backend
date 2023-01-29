class RemoveDeviceIdFromDevice < ActiveRecord::Migration[7.0]
  def change
    remove_column :devices, :device_id, :string
  end
end
