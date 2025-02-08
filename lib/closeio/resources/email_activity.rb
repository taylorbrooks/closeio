module Closeio
  class Client
    module EmailActivity
      def list_email_activities(options = {}, paginate = false)
        if paginate
          paginate(email_activity_path, options)
        else
          get(email_activity_path, options)
        end
      end

      def find_email_activity(id)
        get("#{email_activity_path}#{id}/")
      end

      def create_email_activity(options = {})
        post(email_activity_path, options)
      end

      def update_email_activity(id, options = {})
        put("#{email_activity_path}#{id}/", options)
      end

      def delete_email_activity(id)
        delete("#{email_activity_path}#{id}/")
      end

      private

      def email_activity_path
        'activity/email/'
      end
    end
  end
end
