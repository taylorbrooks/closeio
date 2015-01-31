module Closeio
  class ActivityReport < Base
    attr_reader :date_start, :date_end, :user_id

    def initialize(org_id, date_start, date_end, user_id=nil)
      @path = "/report/activity/#{org_id}"
      @date_start = date_start
      @date_end   = date_end
      @user_id    = user_id
    end

    def run
      query_params = {date_start: date_start, date_end: date_end}
      query_params.merge!(user_id: user_id) if user_id

      get("#{@path}/", query: query_params)
    end

  end
end
