module Closeio
  class Client
    module OpportunityStatus

      def list_opportunity_statuses
        get(opportunity_status_path)
      end

      def create_opportunity_status(options={})
        post(opportunity_status_path, options)
      end

      def update_opportunity_status(id, options={})
        put(opportunity_status_path(id), options)
      end

      def delete_opportunity_status(id)
        delete(opportunity_status_path(id))
      end

      private

      def opportunity_status_path(id=nil)
        id ? "status/opportunity/#{id}/" : "status/opportunity/"
      end

    end
  end
end
