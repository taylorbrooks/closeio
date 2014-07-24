module Closeio
  class Opportunity < Base

    def self.where opts={}
      res = get(resource_path, query: opts)

      if res.success?
        res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
      else
        bad_response res
      end
    end

  end
end