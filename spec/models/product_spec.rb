RSpec.describe Product, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
  end

  context '#relations' do
    it { is_expected.to belong_to :source }
    it { is_expected.to belong_to :source_page }
    it { is_expected.to have_many :prices }
  end
end
