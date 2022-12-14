RSpec.describe Category, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  context '#relations' do
    it { is_expected.to have_many(:source_pages) }
  end
  context '#icon_path' do
    it { expect(subject.icon_path).to eq(nil) }
  end
end
