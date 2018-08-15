module Closeio
  class Client
    module Report
      # OPTIONS [date_start, date_end, user_id]
      def activity_report(organization_id, options = {})
        get("report/activity/#{organization_id}/?", options)
      end

      # OPTIONS [date_start, date_end]
      def lead_status_report(organization_id, options = {})
        get("report/statuses/lead/#{organization_id}/", options)
      end

      # OPTIONS [date_start, date_end, user_id]
      def sent_emails_report(organization_id, options = {})
        get("report/sent_emails/#{organization_id}/", options)
      end
    end
  end
end
