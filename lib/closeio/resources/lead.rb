module Closeio
  class Client
    module Lead

      def list_leads(options = {})
        get(lead_path, query: options)
      end

      def find_lead(id)
        get(individual_lead_path(id))
      end

      def create_lead(options = {})
        post(lead_path, options)
      end

      def update_lead(id, options = {})
        put(individual_lead_path(id, options))
      end

      def delete_lead(id)
        delete(individual_lead_path(id))
      end

      def lead_contacts
      end

      private

      def lead_path
        "lead/"
      end

      def individual_lead_path(id)
        "#{lead_path}#{id}/"
      end

    end
  end
end
