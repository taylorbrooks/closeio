module Closeio
  class Client
    module User
      def list_users
        get('user/')
      end

      def find_user(id)
        get("user/#{id}/")
      end

      def me
        get('me/')
      end

      def fetch_api_key
        get("api_key/#{@api_key}/")
      end

      def available_users(organization_id)
        get("user/availability/?organization_id=#{organization_id}")
      end
    end
  end
end
