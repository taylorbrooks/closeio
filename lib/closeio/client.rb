require 'faraday'
require 'faraday_middleware'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each{|f| require f}

module Closeio
  class Client
    include Closeio::Client::Activity
    include Closeio::Client::BulkAction
    include Closeio::Client::Contact
    include Closeio::Client::CustomField
    include Closeio::Client::EmailTemplate
    include Closeio::Client::Lead
    include Closeio::Client::LeadStatus
    include Closeio::Client::Opportunity
    include Closeio::Client::OpportunityStatus
    include Closeio::Client::Report
    include Closeio::Client::SmartView
    include Closeio::Client::Task
    include Closeio::Client::User

    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def get(path, options={})
      connection.get(path, options).body
    end

    def post(path, req_body)
      connection.post do |req|
        req.url(path)
        req.body = req_body
      end.body
    end

    def put(path, options={})
      connection.put(path, options).body
    end

    def delete(path, options = {})
      connection.delete(path, options).body
    end

    private
    def connection
      Faraday.new(url: "https://app.close.io/api/v1", headers: { accept: 'application/json' }) do |connection|
        connection.basic_auth api_key, ''
        connection.request    :json
        connection.response   :logger
        connection.use        FaradayMiddleware::Mashify
        connection.response   :json
        connection.adapter    Faraday.default_adapter
      end
    end
  end
end
