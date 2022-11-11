FactoryBot.define do
  factory :category do
    name { Faker::Name.name }
    after(:build) do |category|
      category.icon.attach(
        io: File.open(Rails.root.join('spec', 'fixtures/attachments', '1.jpeg')),
        filename: 'test.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
