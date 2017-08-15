module Closeio
  class Client
    module Event

      def list_events(options = {})
        get("event/", options)
      end

    end
  end
end
