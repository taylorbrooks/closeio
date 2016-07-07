require 'faraday'
require 'faraday_middleware'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each{|f| require f}

module Closeio


  class ApiException < Exception
    def initialize(code, message)
      super("CloseIO error (#{code}: #{message}")
    end
  end

  class Client
    include Closeio::Client::Activity
    include Closeio::Client::BulkAction
    include Closeio::Client::Contact
    include Closeio::Client::CustomField
    include Closeio::Client::EmailTemplate
    include Closeio::Client::IntegrationLink
    include Closeio::Client::Lead
    include Closeio::Client::LeadStatus
    include Closeio::Client::Opportunity
    include Closeio::Client::OpportunityStatus
    include Closeio::Client::Organization
    include Closeio::Client::Report
    include Closeio::Client::SmartView
    include Closeio::Client::Task
    include Closeio::Client::User

    attr_reader :api_key, :logger, :ca_file

    def initialize(api_key, logger = true, ca_file = nil)
      @api_key = api_key
      @logger  = logger
      @ca_file  = ca_file
    end

    def get(path, options={})
      result = connection.get(path, options)
      if result.status == 401
        throw new Closeio::ApiException(401, "Your API key does not let you call #{path}")
      end
      result.body
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

    def paginate(path, options={})
      results = []
      skip    = 0

      begin
        res   = get(path, options.merge!(_skip: skip))
        unless res.data.nil? || res.data.empty?
          results.push res.data
          skip += res.data.count
        end
      end while res.has_more
      json = {has_more: false, total_results: res.total_results, data: results.flatten}
      Hashie::Mash.new json
    end

    private

    def assemble_list_query(query, options)
      options[:query] = if query.respond_to? :map
        query.map { |k,v| "#{k}:'#{v}'" }.join(' ')
      else
        query
      end

      options
    end

    def connection
      Faraday.new(url: "https://app.close.io/api/v1", headers: { accept: 'application/json' }, ssl: {
    ca_file: ca_file}) do |conn|
        conn.basic_auth api_key, ''
        conn.request    :json
        conn.response   :logger if logger
        conn.use        FaradayMiddleware::Mashify
        conn.response   :json
        conn.adapter    Faraday.default_adapter
      end
    end
  end
end
