module Closeio
  class Client
    module LeadStatus

      def list_lead_statuses
        get(lead_status_path)
      end

      def create_lead_status(options={})
        post(lead_status_path, options)
      end

      def update_lead_status(id, options={})
        put("#{lead_status_path}#{id}/", options)
      end

      def delete_lead_status(id)
        delete("#{lead_status_path}#{id}/")
      end

      private

      def lead_status_path
        "/status/lead/"
      end

    end
  end
end
