module Closeio
  class Client
    module IntegrationLink

      def list_integration_links
        get(custom_field_path)
      end

      def find_integration_link(id)
        get("#{custom_field_path}#{id}/")
      end

      def create_integration_link(options={})
        post(custom_field_path, options)
      end

      def update_integration_link(id, options={})
        put("#{custom_field_path}#{id}/", options)
      end

      def delete_integration_link(id)
        delete("#{custom_field_path}#{id}/")
      end

      private

      def custom_field_path
        "integration_link/"
      end

    end
  end
end
