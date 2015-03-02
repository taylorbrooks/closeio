module Closeio
  class Client
    module Lead

      def list_leads(params=nil)
        get(lead_path)
      end

      def find_lead(id)
        get(individual_lead_path(id))
      end

      def create_lead
        post(lead_path)
      end

      def update_lead(id)
        put(individual_lead_path(id))
      end

      def delete_lead(id)
        delete(individual_lead_path(id))
      end

      def lead_contacts
      end

      private

      def lead_path
        "lead/"
      end

      def individual_lead_path(id)
        "#{lead_path}#{id}/"
      end

    end
  end
end

#  def self.where opts={}
#    res = get(resource_path, query: opts)

#    if res.success?
#      res['data'].nil? ? [] : res['data'].map{|obj| new(obj)}
#    else
#      bad_response res
#    end
#  end

#  def emails
#    Closeio::EmailActivity.where lead_id: self.id
#  end

#  def notes
#    Closeio::NoteActivity.where lead_id: self.id
#  end

#  def contact
#    self.contacts.first
#  end
