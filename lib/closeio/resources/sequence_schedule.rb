module Closeio
  class Client
    module SequenceSchedule
      def list_sequence_schedules
        get(sequence_schedule_path, {})
      end

      def find_sequence_schedule(id)
        get(sequence_schedule_path(id))
      end

      private

      def sequence_schedule_path(id = nil)
        id ? "sequence_schedule/#{id}/" : 'sequence_schedule/'
      end
    end
  end
end
