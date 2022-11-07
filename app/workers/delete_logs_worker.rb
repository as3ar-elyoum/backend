class DeleteLogsWorker
    include Sidekiq::Worker
    sidekiq_options queue: :delete_logs, retry: 1

    def perform(product_id, source_page_id)
        ProductLog.where(product_id: product_id).where('created_at < ?', 2.days.ago).delete_all
        SourcePageLog.where(source_page_id: source_page_id).where('created_at < ?', 2.days.ago).delete_all
    end
end