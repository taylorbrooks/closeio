module Closeio
  class Client
    module CustomActivityType
      def list_custom_activity_types
        get(custom_activity_type_path)
      end

      def find_custom_activity_type(id)
        get("#{custom_activity_type_path}#{id}/")
      end

      private

      def custom_activity_type_path
        'custom_activity/'
      end
    end
  end
end
