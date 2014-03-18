module Closeio
  class Base < OpenStruct

    include HTTParty
    base_uri   'https://app.close.io/api/v1'
    basic_auth ENV['CLOSEIO_API_KEY'], ''
    headers 'Content-Type' => 'application/json'
    #debug_output $stdout
    format :json

    extend Forwardable
    def_delegators 'self.class', :delete, :get, :post, :put, :resource_path, :bad_response

    attr_reader :data

    def initialize attrs={}
      if attrs['data']
        super attrs['data']
      else
        super Hash[attrs]
      end
    end

    def save
      res = put("#{resource_path}#{self.id}", body: opts.to_json)
      res.ok? ? res : bad_response(res)
    end

    class << self
      def bad_response response
        if response.class == HTTParty::Response
          raise HTTParty::ResponseError, response
        end
        raise StandardError, 'Unknown error'
      end

      def all response = nil, opts={}
        res = response || get(resource_path, opts)

        if res.success?
          res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
        else
          bad_response res
        end
      end

      # Closeio::Lead.create name: "Bluth Company", contacts: [{name: "Buster Bluth", emails: [{email: "cartographer@bluthcompany.com"}]}]
      def create opts={}
        res = post resource_path, body: opts.to_json
        res.success? ? new(res) : bad_response(res)
      end

      #
      # Closeio::Lead.update '39292', name: "Bluth Company", contacts: [{name: "Buster Bluth", emails: [{email: "cartographer@bluthcompany.com"}]}]
      #
      def update id, opts={}
        put "#{resource_path}#{id}/", body: opts.to_json
      end

      def destroy id
        if res['data'].is_a? Array
          raise "Yo I'm an array"
        else
          delete "#{resource_path}#{id}/"
        end
      end

      def find id
        res = get "#{resource_path}#{id}/"
        res.ok? ? new(res) : bad_response(res)
      end

      def where opts={}
        res = get(resource_path, query: opts)

        if res.success?
          res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
        else
          bad_response res
        end
      end

      def resource_path
        klass = name.split('::').last.gsub(/([a-z\d])([A-Z])/,'\1_\2').downcase
        return "/#{klass}/"
      end
    end
  end
end
