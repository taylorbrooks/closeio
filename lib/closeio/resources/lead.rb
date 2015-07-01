module Closeio
  class Client
    module Lead

      def list_leads(options = {}, paginate = false, fields = nil)
        params = { query: options }
        params.merge!( _fields: fields ) if fields

        if paginate
          paginate(lead_path, params)
        else
          get(lead_path, params)
        end
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

      def merge_leads(id_source, id_destination)
        post('lead/merge/', { source: id_source, destination: id_destination })
      end

      private

      def lead_path(id=nil)
        id ? "lead/#{id}/" : "lead/"
      end

    end
  end
end
