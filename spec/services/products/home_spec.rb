RSpec.describe Products::Home do
  describe "#perform" do
    context "when there are two active categories" do
      let(:active_category) { create(:category) }
      let!(:active_products) { create_list(:product, 2, :with_source, :active, category: active_category) }

      subject { described_class.new.perform }

      it "loads home data" do
        expected_result = [{ category: active_category, products: active_products }]
        expect(subject).to match_array(expected_result)
      end
    end
  end
end
