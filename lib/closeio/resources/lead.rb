module Closeio
  class Client
    module Lead

      def list_leads(options = {})
        get(lead_path, query: options)
      end

      def find_lead(id)
        get(lead_path(id))
      end

      def create_lead(options = {})
        post(lead_path, options)
      end

      def update_lead(id, options = {})
        put(lead_path(id), options)
      end

      def delete_lead(id)
        delete(lead_path(id))
      end

      private

      def lead_path(id=nil)
        id ? "lead/#{id}/" : "lead/"
      end

    end
  end
end
