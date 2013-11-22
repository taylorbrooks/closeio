module Closeio
  class SavedSearch < Base
    def leads
      Closeio::Lead.where query: self.query
    end
  end
end