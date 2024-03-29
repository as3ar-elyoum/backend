RSpec.describe Device, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:fcm_token) }
    it { is_expected.to validate_uniqueness_of(:fcm_token) }
  end
end
