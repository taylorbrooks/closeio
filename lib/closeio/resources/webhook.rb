module Closeio
  class Client
    module Webhook
      def list_webhooks
        get(webhook_path)
      end

      def find_webhook(id)
        get(webhook_path(id))
      end

      def create_webhook(options = {})
        post(webhook_path, options)
      end

      def update_webhook(id, options = {})
        put(webhook_path(id), options)
      end

      def delete_webhook(id)
        delete(webhook_path(id))
      end

      private

      def webhook_path(id = nil)
        id ? "webhook/#{id}/" : 'webhook/'
      end
    end
  end
end
