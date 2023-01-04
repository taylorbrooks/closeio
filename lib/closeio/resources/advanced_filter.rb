module Closeio
  class Client
    module AdvancedFilter
      def advanced_filter(query)
        post(advanced_filter_path, query)
      end

      private

      def advanced_filter_path
        'data/search/'
      end

    end
  end
end
