module Closeio
  class Client
    module CustomField

      def list_custom_fields
        get(custom_field_path)
      end

      def find_custom_field(id)
        get("#{custom_field_path}#{id}/")
      end

      def create_custom_field(options={})
        post(custom_field_path, options)
      end

      def update_custom_field(id, options={})
        put("#{custom_field_path}#{id}/", options)
      end

      def delete_custom_field(id)
        delete("#{custom_field_path}#{id}/")
      end

      private

      def custom_field_path
        "custom_fields/lead/"
      end

    end
  end
end
