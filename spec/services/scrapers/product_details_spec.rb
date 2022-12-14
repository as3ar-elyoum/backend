RSpec.describe Scrapers::ProductDetails do
  let!(:source) { create(:source) }
  let!(:source_config) { create(:source_config, source:) }
  let!(:product) { create(:product, source:) }

  let(:scraper) { described_class.new(product.id) }
  let(:file_path) { "#{Rails.root}/spec/fixtures/scraped_data/air_frayer_amzn.html" }
  let(:page_content) { File.read(file_path) }
  let(:mechanize_page) do
    Mechanize::Page.new(URI::HTTP.build(url: product.url), nil, page_content, 200, Mechanize.new)
  end

  before do
    described_class.any_instance.stub(:fetch_document).and_return(mechanize_page)
    Product.any_instance.stub(:index_document)
    Products::Categorize.stub(:perform)
  end

  context '#scraping' do
    it do
      expect(product.price).to be_nil
      expect(product.active?).to be_falsey

      scraper.perform

      product.reload
      expect(product.price).not_to be_nil
      expect(product.price).to eq(3475)
      expect(product.name).to eq('بلاك & ديكر ايروفراي مقلاة الهواء سعة 4 لتر - اسود/ذهبي، AF300-B5')
      expect(product.active?).to be_truthy
    end
  end
end
