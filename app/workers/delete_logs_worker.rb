class DeleteLogsWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 1

  def perform
    SourcePageLog.where('created_at < ?', 2.days.ago).delete_all
  end
end
