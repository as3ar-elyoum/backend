module Products
  class Backfill
    def self.perform
      products = Product.order(id: :asc).find_each do |product|
        unless product.valid?
          product.unique_identifier = SecureRandom.hex(16)
          product.status = :duplicate
        end
        product.save
      rescue StandardError => e
      end
    end
  end
end
