RSpec.describe 'HealthCheckController', type: :request do
    describe '#index' do
        it 'returns a 200 OK status code' do
            get '/'
            expect(response).to have_http_status(:ok)
        end
    end
end
