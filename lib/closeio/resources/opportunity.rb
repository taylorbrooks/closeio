module Closeio
  class Client
    module Opportunity

      def list_opportunities(options={})
        get(opportunity_path, options)
      end

      def find_opportunity(id)
        get(opportunity_path(id))
      end

      def create_opportunity(options={})
        post(opportunity_path, options)
      end

      def update_opportunity(id, options={})
        put(opportunity_path(id), options)
      end

      def delete_opportunity(id)
        delete(opportunity_path(id))
      end

      private

      def opportunity_path(id=nil)
        id ? "opportunity/#{id}/" : "opportunity/"
      end

    end
  end
end
