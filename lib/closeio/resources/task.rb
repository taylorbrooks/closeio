module Closeio
  class Client
    module Task

      def list_tasks(options={})
        get(task_path, options)
      end

      def find_task(id)
        get(task_path(id))
      end

      def create_task(options={})
        post(task_path, options)
      end

      def update_task(id, options={})
        put(task_path(id), options)
      end

      def delete_task(id)
        delete(task_path(id))
      end

      private

      def task_path(id=nil)
        id ? "task/#{id}/" : "task/"
      end

    end
  end
end
