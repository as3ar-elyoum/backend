RSpec.describe ProductLog, type: :model do
    context '#relations' do
        it { is_expected.to belong_to :product }
    end
end
