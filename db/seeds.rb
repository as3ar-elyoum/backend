require 'csv'

def create_sources
  file_content = File.read('public/sources.json')
  json_data = JSON.parse(file_content)

  json_data.each do |entry|
    source = Source.find_or_create_by(url: entry['url'])
    source.name = entry['name']
    source.active = entry['active'] || true
    source.url_prefix = entry['url_prefix']
    source.selectors = entry['selectors']
    source.save

    entry['pages'].each do |page_entry|
      page = SourcePage.find_or_create_by(url: page_entry['url'])
      page.name = page_entry['name']
      page.source = source
      page.save
    end
  end
end

create_sources
