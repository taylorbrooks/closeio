module Closeio
  class Client
    module Sequence
      def list_sequences
        get(sequence_path, {})
      end

      def find_sequence(id)
        get(sequence_path(id))
      end

      def create_sequence(options = {})
        post(sequence_path, options)
      end

      def update_sequence(id, options = {})
        put(sequence_path(id), options)
      end

      def delete_sequence(id)
        delete(sequence_path(id))
      end

      private

      def sequence_path(id = nil)
        id ? "sequence/#{id}/" : 'sequence/'
      end
    end
  end
end
