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
  def self.configure(api_key=nil)
    Base.configure(api_key)
  end

  def self.reset
    Closeio::Base.default_options[:basic_auth][:username] = nil

    Closeio::Base.descendants.each do |resource|
      resource.default_options[:basic_auth][:username] = nil
    end
  end
end
