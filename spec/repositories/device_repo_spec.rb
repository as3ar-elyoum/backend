describe DeviceRepo do
    let!(:device) { create :device }
    let!(:repo_instance) { described_class.new }

    it 'updates device last usage time' do
        expect { repo_instance.update_usage_time(device.fcm_token) }.to change { device.reload.last_usage_time }
    end

    it "find_or_create a device by fcm_token" do
        expect(device.fcm_token).to be_truthy
        found_or_created_device = Device.find_or_create_by({ fcm_token: device.fcm_token })
        expect(found_or_created_device).to be_an_instance_of(Device)
    end
end