RSpec.describe ProductHitRepo do
    let!(:source) { create(:source) }
    let!(:product) { create(:product, source:) }
    let(:device) { create(:device) }
    let(:repo_instance) { described_class.new(product.id, device.fcm_token) }

    it "creates a ProductHit" do
      expect { repo_instance.create }.to change(ProductHit, :count).by(1)
    end

    it "creates a ProductHit with product and device" do
      repo_instance.create
      product_hit = ProductHit.last
      expect(product_hit.product).to eq product
      expect(product_hit.device).to eq device
    end

    context "when the device is not found" do
      it "does not create a ProductHit" do
        product_hit_repo = described_class.new(product.id, nil)
        expect { product_hit_repo.create }.not_to change(ProductHit, :count)
      end
    end
end
