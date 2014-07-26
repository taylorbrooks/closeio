module Closeio
  class StatusReport < Base
    def self.resource_path
      return "/report/statuses/lead/"
    end

    def self.leads organization_id, opts={}
      get "#{resource_path}#{organization_id}/", query: opts
    end
  end
end