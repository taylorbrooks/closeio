module Closeio
  class CustomReport < Base
    def self.resource_path
      return "/report/custom/"
    end

    def self.leads organization_id, opts={}
      get "#{resource_path}lead/#{organization_id}/", query: opts
    end
  end
end