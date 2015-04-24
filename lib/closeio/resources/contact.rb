module Closeio
  class Client
    module Contact

      def list_contacts(params=nil)
        get(contact_path)
      end

      def find_contact(id)
        get(contact_path(id))
      end

      def create_contact(options = {})
        post(contact_path, options)
      end

      def update_contact(id, options = {})
        put(contact_path(id), options)
      end

      def delete_contact(id)
        delete(contact_path(id))
      end

      private

      def contact_path(id=nil)
        id ? "contact/#{id}/" : "contact/"
      end

    end
  end
end
