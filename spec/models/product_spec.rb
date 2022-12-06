RSpec.describe Product, type: :model do
  before do
    Product.any_instance.stub(:update_score)
    Product.any_instance.stub(:enqueue_scraper_worker)
    Product.any_instance.stub(:check_price)
  end

  context '#validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
  end

  context '#relations' do
    it { is_expected.to belong_to :source }
    it { is_expected.to have_many :prices }
  end
end
