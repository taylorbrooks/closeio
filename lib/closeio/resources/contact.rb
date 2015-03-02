module Closeio
  class Client
    module Contact

      def list_contacts(params=nil)
        get(contact_path)
      end

      def find_contact(id)
        get(individual_contact_path(id))
      end

      def create_contact
        post(contact_path)
      end

      def update_contact
        put(individual_contact_path(id))
      end

      def delete_contact(id)
        delete(individual_contact_path(id))
      end

      private

      def contact_path
        "contact/"
      end

      def individual_contact_path(id)
        "#{contact_path}#{id}/"
      end

    end
  end
end
