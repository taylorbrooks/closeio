require 'httparty'
require 'ostruct'
require 'forwardable'

require 'closeio/base'
require 'closeio/bulk_action'
require 'closeio/contact'
require 'closeio/custom_field'
require 'closeio/email_activity'
require 'closeio/email_template'
require 'closeio/lead'
require 'closeio/lead_status'
require 'closeio/note_activity'
require 'closeio/organization'
require 'closeio/opportunity'
require 'closeio/opportunity_status'
require 'closeio/paginated_list'
require 'closeio/custom_report'
require 'closeio/status_report'
require 'closeio/saved_search'
require 'closeio/task'
require 'closeio/user'
require 'closeio/version'
require 'closeio/config'
require 'closeio/railtie' if defined?(Rails)

module Closeio
  def self.configure(api_key=nil, opts={})
   set_api_keys(api_key, opts={})
  end

  def self.reset
    set_api_keys(nil)
  end

  def self.set_api_keys(api_key, opts={})
    hash = {basic_auth: {username: api_key, password: ''}}.merge!(opts)

    Closeio::Base.default_options.merge!(hash)
    Closeio::Base.descendants.each do |resource|
      resource.default_options.merge!(hash)
    end
  end
end
