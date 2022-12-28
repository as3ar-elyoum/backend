class ProductHit < ApplicationRecord
  belongs_to :device
  belongs_to :product
end
