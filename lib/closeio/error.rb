module Closeio
  class Error < StandardError; end
  class NotAuthorized < Error; end
  class NotFound < Error; end
  class GatewayTimeout < Error; end
  class TooManyRequests < Error; end
end

require 'faraday'
module FaradayMiddleware
  class CloseioErrorHandler < Faraday::Middleware
    ERROR_STATUSES = 400..600
    def on_complete(env)
      case env[:status]
      when 401
        raise Closeio::NotAuthorized, env.body
      when 404
        raise Closeio::NotFound, env.body
      when 429
        raise Closeio::TooManyRequests, env.body
      when 504
        raise Closeio::GatewayTimeout, env.body
      when ERROR_STATUSES
        raise Closeio::Error, "#{env.status}: #{env.body}"
      end
    end
  end
end
