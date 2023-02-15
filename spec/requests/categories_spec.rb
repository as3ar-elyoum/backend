RSpec.describe CategoriesController, type: :controller do
    let!(:category) {create(:category)}

    describe '#index' do
        before do
            get :index
        end
        it 'returns status code 200' do
            expect(response).to have_http_status(:success)
        end
    end

    describe "#show" do
        before { 
            get :show, params: {id: category.id}
        }

        it "renders the show template" do
            expect(response).to have_http_status(:ok)
        end
    end

    describe "#new" do
        before do
            get :new
        end

        it "renders the new template" do            
            expect(response).to have_http_status(:ok)
        end
    end

    # describe '#create' do
    #     context 'with valid parameters' do
    #         it 'creates a new category' do
    #             expect { post :create, params: { category: {name: category.name, keywords: "test", icon: "test.png", active: true} } }.to
    #                 change(Category, :count).by(1)
    #         end

    #         # it 'returns created device' do
    #         #     post :create, params: { fcm_token: test_token }
    #         #     expect(response.status).to eq 201
    #         # end
    #         # end

    #         # context 'with invalid parameters' do
    #         # it 'returns Bad Request error' do
    #         #     post :create, params: { fcm_token: nil }
    #         #     expect(response.status).to eq 204
    #         # end
    #         # end
    #     end
    # end
end
