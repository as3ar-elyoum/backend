class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :device_id
      t.string :user_token

      t.timestamps
    end
  end
end
