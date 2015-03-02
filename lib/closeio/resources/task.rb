module Closeio
  class Client
    module Task

      def list_tasks(options={})
        get(task_path, options)
      end

      def find_task(id)
        get(individual_task_path(id))
      end

      def create_task(options={})
        post(task_path, options)
      end

      def update_task(id, options={})
        put(individual_task_path(id), options)
      end

      def delete_task(id)
        delete(individual_task_path(id))
      end

      private

      def task_path
        "task/"
      end

      def individual_task_path(id)
        "#{task_path}#{id}/"
      end

    end
  end
end
