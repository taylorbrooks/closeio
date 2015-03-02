module Closeio
  class Client
    module Organization

      def find_organization(id)
        get("organization/#{id}/")
      end

      def update_organization(id, options = {})
        put("organization/#{id}/", options)
      end

    end
  end
end
