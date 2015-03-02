module Closeio
  class Client
    module Opportunity

      def list_opportunities(options={})
        get(opportunity_path, query: options)
      end

      def find_opportunity(id)
        get(individual_opportunity_path(id))
      end

      def create_opportunity(options={})
        post(opportunity_path, options)
      end

      def update_opportunity(id, options={})
        put(individual_opportunity_path(id), options)
      end

      def delete_opportunity(id)
        delete(individual_opportunity_path(id))
      end

      private

      def opportunity_path
        "opportunity/"
      end

      def individual_opportunity_path(id)
        "#{opportunity_path}#{id}/"
      end

    end
  end
end
