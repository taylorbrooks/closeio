module Closeio
  class Error < StandardError; end
  class NotAuthorized < Error; end
end

require "faraday"
module FaradayMiddleware
  class CloseioErrorHandler < Faraday::Response::Middleware
    ERROR_STATUSES = 400..600
    def on_complete(env)
      case env[:status]
      when 401
        raise Closeio::NotAuthorized, env.body
      when ERROR_STATUSES
        raise Closeio::Error, "#{env.status}: #{env.body}"
      end
    end
  end
end
