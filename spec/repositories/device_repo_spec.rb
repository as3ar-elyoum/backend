RSpec.describe DeviceRepo do
    let!(:device) { create :device }
    let!(:repo_instance) { described_class.new }

    it 'updates device last usage time' do
        expect { repo_instance.update_usage_time(device.fcm_token) }.to change { device.reload.last_usage_time }
    end

    context "find_or_create a device by fcm_token" do
        it "create device if not found" do
            create_device = Device.create({ fcm_token: device.fcm_token })
            expect(create_device).to be_an_instance_of(Device)
        end

        it "find device by fcm_token" do 
            found_device = Device.find_by ({ fcm_token: device.fcm_token } )
            expect(found_device).to eq(device)
        end
    end
end
