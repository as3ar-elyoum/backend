module Handlers
  class AbstractHandler
    def self.handles(event)
      @event = event
    end

    def self.execute(event)
      handler_instance = new(event)
      handler_instance.execute(event)
    end

    def self.handles?(event)
      return false unless @event

      event.instance_of?(@event)
    end

    private

    def new; end

    def initialize(event)
      @event = event
    end
  end
end
