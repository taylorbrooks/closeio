module Closeio
  class Client
    module SequenceSubscription
      def list_sequence_subscriptions
        get(sequence_subscription_path, {})
      end

      def find_sequence_subscription(id)
        get(sequence_subscription_path(id))
      end

      def subscribe_contact(options = {})
        post(sequence_subscription_path, options)
      end

      def update_sequence_subscription(id, options = {})
        put(sequence_subscription_path(id), options)
      end

      private

      def sequence_subscription_path(id = nil)
        id ? "sequence_subscription/#{id}/" : 'sequence_subscription/'
      end
    end
  end
end
