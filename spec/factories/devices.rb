FactoryBot.define do
  factory :device do
    fcm_token { Faker::Crypto.sha1 }
  end
end
