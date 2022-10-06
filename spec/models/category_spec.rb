RSpec.describe Category, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  context '#relations' do
    it { is_expected.to have_many(:source_pages) }
  end
end
