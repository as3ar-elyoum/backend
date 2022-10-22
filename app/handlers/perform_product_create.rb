module Handlers
  class PerformProductCreate < Handlers::AbstractHandler
    handles Events::ProductUrlsFetched

    def execute(payload)
      puts payload
    end
  end
end
