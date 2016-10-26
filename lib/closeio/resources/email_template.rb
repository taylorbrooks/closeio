module Closeio
  class Client
    module EmailTemplate

      def list_email_templates(params = {}, paginate = false)
        if paginate
          paginate(email_template_path, params)
        else
          get(email_template_path, params)
        end
      end

      def find_email_template(id)
        get("#{email_template_path}#{id}/")
      end

      def render_email_templates(id, params = {}, paginate = false)
        if paginate
          paginate("email_template/#{id}/", params)
        else
          get("email_template/#{id}/render/", params)
        end
      end

      def create_email_template(id, options={})
        post(email_template_path, options)
      end

      def update_email_template(id, options={})
        put("#{email_template_path}#{id}/", options)
      end

      def delete_email_template(id)
        delete("#{email_template_path}#{id}/")
      end

      private

      def email_template_path
        "email_template/"
      end
    end
  end
end
