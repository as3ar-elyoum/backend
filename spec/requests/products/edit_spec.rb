RSpec.describe 'ProductsController', type: :request do
    let(:product) { create(:product, :with_source) }

    describe '#edit' do
        before do
            get "/products/#{product.id}/edit"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end

end