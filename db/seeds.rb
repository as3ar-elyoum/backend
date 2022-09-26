btech = Source.create(name: 'بي تك', url: 'https://btech.com/ar/', url_prefix: '', active: true)

page = SourcePage.create(source: btech, url: 'https://btech.com/ar/moblies/mobile-phones-smartphones/smartphones.html',
                         selectors: { product_urls: '.product-item-view a' }.to_json, active: true)
