class SourcePagesCheckWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 2

  def perform
    SourcePage.active.order('RANDOM()').each(&:enqueue_scraper)
  end
end
