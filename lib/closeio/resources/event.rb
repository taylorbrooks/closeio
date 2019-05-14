module Closeio
  class Client
    module Event
      def list_events(options = {})
        get('event/', options)
      end

      def find_event(id)
        get("event/#{id}/")
      end
    end
  end
end
