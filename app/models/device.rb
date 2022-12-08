class Device < ApplicationRecord
    validates :device_id, presence: true, uniqueness: true
    validates :fcm_token, presence: true
end
