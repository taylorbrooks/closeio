module Closeio
  class User < Base
    def self.me
      get "/me"
    end
  end
end