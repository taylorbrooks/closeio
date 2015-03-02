module Closeio
  class Client
    module User

      def find_user(id)
        get("user/#{id}/")
      end

      def me
        get("me/")
      end

    end
  end
end
