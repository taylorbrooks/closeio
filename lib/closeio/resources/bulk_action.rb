module Closeio
  class Client
    module BulkAction

      def list_bulk_emails
        get(bulk_action_path)
      end

      def send_bulk_email(options={})
        post("#{bulk_action_path}email/", options)
      end

      def bulk_delete(options={})
        post("#{bulk_action_path}delete/", options)
      end

      def bulk_edit(options={})
        # query: search query for the edit
        # type:
        #        set_lead_status: lead_status_id
        #        clear_custom_field: custom_field_name
        #        set_custom_field: custom_field_name, custom_field_value
        post("#{bulk_action_path}edit/", options)
      end

      private

      def bulk_action_path
        "bulk_action/"
      end

    end
  end
end
