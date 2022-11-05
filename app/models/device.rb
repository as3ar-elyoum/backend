class Device < ApplicationRecord
    validates :device_id, uniqueness: true
end
