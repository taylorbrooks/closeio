module Closeio
  class Client
    module EmailAccount
      def list_email_accounts
        get('email_account/')
      end
    end
  end
end
