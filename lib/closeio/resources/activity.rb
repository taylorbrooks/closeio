module Closeio
  class Client
    module Activity

      def list_activities(options={})
        get(activity_path, options)
      end

      #
      #  Note Activities
      #

      def list_notes(options={})
        get(note_path, options)
      end

      def find_note(id)
        get("#{note_path}#{id}/")
      end

      def create_note(options)
        post(note_path, options)
      end

      def update_note(id, options={})
        put("#{note_path}#{id}/", options)
      end

      def delete_note(id)
        delete("#{note_path}#{id}/")
      end

      #
      #  Email Activities
      #

      def list_emails(options={})
        get(email_path, options)
      end

      def find_email(id)
        get("#{email_path}#{id}/")
      end

      def create_email(body)
        post(email_path, body)
      end

      def update_email(id, options={})
        put("#{email_path}#{id}/", options)
      end

      def delete_email(id)
        delete("#{email_path}#{id}/")
      end

      #
      #  EmailThread Activities
      #

      def list_emailthreads(options={})
        get(emailthread_path, options)
      end

      def find_emailthread(id)
        get("#{emailthread_path}#{id}/")
      end

      def delete_emailthread(id)
        delete("#{emailthread_path}#{id}/")
      end

      #
      #  Call Activities
      #

      def list_calls(options={})
        get(call_path, options)
      end

      def create_call(options={})
        post(call_path, options)
      end

      def delete_call(id)
        delete("#{call_path}#{id}/")
      end

      private

      def activity_path
        "activity/"
      end

      def note_path
        "activity/note/"
      end

      def email_path
        "activity/email/"
      end

      def emailthread_path
        "activity/emailthread/"
      end

      def call_path
        "activity/call/"
      end

    end
  end
end
