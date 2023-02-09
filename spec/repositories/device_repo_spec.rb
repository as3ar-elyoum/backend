RSpec.describe DeviceRepo do
    let!(:device) { create(:device) }
    let!(:repo_instance) { described_class.new }

    context 'updates successfully' do
        it 'updates device last usage time' do
            expect { repo_instance.update_usage_time(device.fcm_token) }.to change { device.reload.last_usage_time }
        end
    end
end