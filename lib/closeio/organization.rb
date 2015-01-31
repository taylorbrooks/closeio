module Closeio
  class Organization < Base

    def users
      self.memberships
    end
  end
end
