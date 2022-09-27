RSpec.describe 'SourcePage', type: :model do
    context '#validations' do
        it { is_expected.to belong_to(:Source) }
        it { is_expected.to validate_presence_of(:name) }
        it { is_expected.to validate_presence_of(:url) }
    end
end
  