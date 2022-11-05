class RenameTokenToFcmToken < ActiveRecord::Migration[7.0]
  def change
    rename_column :devices, :token, :fcm_token
  end
end
