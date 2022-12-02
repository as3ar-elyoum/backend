require 'active_support'
require 'active_support/core_ext'

class DomainEvent
  HANDLERS = [
    Handlers::PerformProductCreate,
    Handlers::UpdateSourcePageScrapeTime,
    Handlers::PerformProductUpdate,
    Handlers::PerformProductCategorize,
    Handlers::DeactivateProduct,
    Handlers::CreateProductPrice
  ]

  class Publisher
    def self.publish(event)
      handlers = handlers_for(event)
      handlers.map do |handler|
        handler.execute(event)
      end
    end

    def self.handlers_for(event)
      DomainEvent::HANDLERS.select { |handler| handler.handles? event }
    end
  end
end
