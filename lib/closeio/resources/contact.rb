module Closeio
  class Client
    module Contact

      def list_contacts(params=nil)
        get(contact_path)
      end

      def find_contact(id)
        get(contact_path(id))
      end

      def create_contact
        post(contact_path)
      end

      def update_contact
        put(contact_path(id))
      end

      def delete_contact(id)
        delete(contact_path(id))
      end

      private

      def contact_path(id)
        id ? "contact/#{id}/" : "contact/"
      end

    end
  end
end
