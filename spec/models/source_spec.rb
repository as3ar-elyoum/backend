RSpec.describe Source, type: :model do
  context '#validations' do
    it { is_expected.to have_many(:source_pages) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
  end
end
