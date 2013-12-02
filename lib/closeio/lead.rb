module Closeio
  class Lead < Base
    #
    # Options: '_limit' => 1000, 'query' => 'custom.status:2'
    #
    def self.where opts={}
      res = get(resource_path, query: opts)

      if res.success?
        res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
      else
        bad_response res
      end
    end

    def emails
      Closeio::EmailActivity.where lead_id: self.id
    end

    def contact
      self.contacts.first
    end
  end
end