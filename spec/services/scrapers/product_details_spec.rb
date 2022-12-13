RSpec.describe Scrapers::ProductDetails do
    let!(:source) { create(:source) }
    let!(:product) { create(:product, source:) }

    let(:scraper) { described_class.new(product.id) }
    let(:file_path) { "#{Rails.root}/spec/fixtures/scraped_data/tv.amazon.eg.html" }
    let(:page_content) { File.read(file_path) }
    let(:mechanize_page) do
        Mechanize::Page.new(URI::HTTP.build(url: product.url), nil, page_content, 200, Mechanize.new)
    end

    before do
        described_class.any_instance.stub(:fetch_document).and_return(mechanize_page)
    end


    # context '#fetch_title' do
    #     it do
    #         expect(scraper.fetch_title).to eq('Samsung 55" 4K UHD Smart TV')
    #     end
    # end

    # context '#fetch_price' do
    #     it do
    #         expect(scraper.fetch_price).to eq(1399.0)
    #     end
    # end

    # context '#fetch_image' do
    #     it do
    #         expect(scraper.fetch_image).to eq('https://images-na.ssl-images-amazon.com/images/I/71Q2QoZr7rL._AC_SL1500_.jpg')
    #     end
    # end

    # context '#fetch_description' do
    #     it do
    #         expect(scraper.fetch_description).to eq('Samsung 55" 4K UHD Smart TV')
    #     end
    # end

    # context '#fetch_document' do
    #     it do
    #         expect(scraper.fetch_document).to be_a(Mechanize::Page)
    #     end
    # end


    context '#scraping' do
        it do
            scraper.perform
        end
    end
end





