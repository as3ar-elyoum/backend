WebMock.disable_net_connect!(allow_localhost: true)
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    config.render_views
    Product.any_instance.stub(:index_document)
    Product.any_instance.stub(:delete_document)

    DatabaseCleaner.strategy = :deletion
    DatabaseCleaner.clean_with :truncation

    DatabaseCleaner.start
    DatabaseCleaner.clean
  end
end
