module Closeio
  class Client
    module SmartView

      def list_smart_views
        get(smart_view_path)
      end

      def find_smart_view(id)
        get(smart_view_path(id))
      end

      def create_smart_view(options={})
        post(smart_view_path, options)
      end

      def update_smart_view(id, options={})
        put(smart_view_path(id), options)
      end

      def delete_smart_view(id)
        delete(smart_view_path(id))
      end

      private

      def smart_view_path(id=nil)
        id ? "saved_search/#{id}/" : "saved_search/"
      end

    end
  end
end
