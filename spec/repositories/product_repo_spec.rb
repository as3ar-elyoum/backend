RSpec.describe ProductRepo do
  let!(:source) { create(:source) }
  let!(:product) { create(:product, source:) }

  let(:repo_instance) { described_class.new(product.id) }
  context 'updates successfully' do
    it 'updates products with the detilas' do
      expect(product.active?).to be_falsey
      repo_instance.update({ price: 10 })
      expect(product.reload.active?).to be_truthy
    end
  end
end
