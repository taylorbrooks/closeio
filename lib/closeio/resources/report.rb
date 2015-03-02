module Closeio
  class Client
    module Report

      # def activity_report(org_id, date_start, date_end, user_id=nil)
      #   params = {date_start: date_start, date_end: date_end}
      #   params.merge!(user_id: user_id) if user_id

      #   get("#{@path}/#{org_id}", query: params)
      # end
      #

      def lead_status_report(organization_id, options = {})
        get("report/statuses/lead/#{organization_id}/", options)
      end

    end
  end
end
