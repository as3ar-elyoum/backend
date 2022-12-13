RSpec.describe Device, type: :model do
  context '#validations' do
    it { is_expected.to validate_presence_of(:device_id) }
    it { is_expected.to validate_uniqueness_of(:device_id) }
    it { is_expected.to validate_presence_of(:fcm_token) }
  end

  context '#time_ago' do
    it { is_expected.to '' if :last_usage_time == nil }
  end
end
