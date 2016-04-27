module Closeio
  class Client
    module IntegrationLink

      def list_integration_links
        get(integration_link_path)
      end

      def find_integration_link(id)
        get("#{integration_link_path}#{id}/")
      end

      def create_integration_link(options={})
        post(integration_link_path, options)
      end

      def update_integration_link(id, options={})
        put("#{integration_link_path}#{id}/", options)
      end

      def delete_integration_link(id)
        delete("#{integration_link_path}#{id}/")
      end

      private

      def integration_link_path
        "integration_link/"
      end

    end
  end
end
