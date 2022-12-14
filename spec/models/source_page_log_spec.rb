RSpec.describe SourcePageLog, type: :model do
  context '#relations' do
    it { is_expected.to belong_to :source_page }
  end
end
