RSpec.describe 'ProductsController', type: :request do
    let(:product) { create(:product, :with_source) }
    
    describe '#index' do
        before do
            get "/products"
        end
        it 'returns status code 200' do
            expect(response.status).to eq 200
        end
    end

end