RSpec.describe Category, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
  context '#relations' do
    it { is_expected.to have_many(:source_pages) }
  end
  context "#icon_path" do
    it { is_expected.to '' if :icon == nil }
  end
end
