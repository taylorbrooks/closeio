module Closeio
  class Client
    module Filter

      def filter(body={})
        post(advanced_filter_path, body)
      end

      private

      def advanced_filter_path
        'data/search/'
      end
    end
  end
end
