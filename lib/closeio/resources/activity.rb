module Closeio
  class Client
    module Activity
      def list_activities(options = {})
        get(activity_path, options)
      end

      #
      #  Note Activities
      #

      def list_notes(options = {})
        get(note_path, options)
      end

      def find_note(id)
        get("#{note_path}#{id}/")
      end

      def create_note(options)
        post(note_path, options)
      end

      def update_note(id, options = {})
        put("#{note_path}#{id}/", options)
      end

      def delete_note(id)
        delete("#{note_path}#{id}/")
      end

      #
      #  Email Activities
      #

      def list_emails(options = {})
        get(email_path, options)
      end

      def find_email(id)
        get("#{email_path}#{id}/")
      end

      def create_email(body)
        post(email_path, body)
      end

      def update_email(id, options = {})
        put("#{email_path}#{id}/", options)
      end

      def delete_email(id)
        delete("#{email_path}#{id}/")
      end

      #
      #  EmailThread Activities
      #

      def list_emailthreads(options = {})
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

      def list_calls(options = {})
        get(call_path, options)
      end

      def find_call(id)
        get("#{call_path}#{id}/")
      end

      def create_call(options = {})
        post(call_path, options)
      end

      def delete_call(id)
        delete("#{call_path}#{id}/")
      end

      #
      #  SMS Activities
      #

      def list_sms(options = {})
        get(sms_path, options)
      end

      def find_sms(id)
        get("#{sms_path}#{id}/")
      end

      def create_sms(options)
        post(sms_path, options)
      end

      def update_sms(id, options = {})
        put("#{sms_path}#{id}/", options)
      end

      def delete_sms(id)
        delete("#{sms_path}#{id}/")
      end

      #
      # Custom Activity
      #

      def list_custom_activities(options = {})
        get(custom_activity_path, options)
      end

      def find_custom_activity(id)
        get("#{custom_activity_path}#{id}/")
      end

      def create_custom_activity(options)
        post(custom_activity_path, options)
      end

      def update_custom_activity(id, options = {})
        put("#{custom_activity_path}#{id}/", options)
      end

      def delete_custom_activity(id)
        delete("#{custom_activity_path}#{id}/")
      end

      private

      def activity_path
        'activity/'
      end

      def note_path
        "#{activity_path}note/"
      end

      def email_path
        "#{activity_path}email/"
      end

      def emailthread_path
        "#{activity_path}emailthread/"
      end

      def call_path
        "#{activity_path}call/"
      end

      def sms_path
        "#{activity_path}sms/"
      end

      def custom_activity_path
        "#{activity_path}custom/"
      end
    end
  end
end
