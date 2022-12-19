module Closeio
  class Client
    module CustomActivity
      def list_custom_activities(options = {})
        get(custom_activity_path, options)
      end

      def create_custom_activity(options = {})
        post(custom_activity_path, options)
      end

      def delete_custom_activity(id)
        delete("#{custom_activity_path}#{id}/")
      end

      private

      def custom_activity_path
        'activity/custom/'
      end
    end
  end
end
