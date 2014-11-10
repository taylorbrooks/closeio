module Closeio
  class BulkAction < Base
    def initialize(query, value)
      @query  = query
      @value  = value
      @path   = "#{resource_path}edit/"
    end

    def clear_custom_field
      post(@path, body: {
        query: @query,
        type: "clear_custom_field",
        custom_field_name: @value}.to_json
      )
    end

    def set_lead_status
      post(@path, body: {
        query: @query,
        type: "set_lead_status",
        lead_status_id: @value}.to_json
      )
    end
  end
end
