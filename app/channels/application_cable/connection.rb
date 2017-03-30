module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_chef
    # Connection identified by current_user

    def connect
      # Set the current_chef variable, the one used for the client's identification
      self.current_chef = find_current_user
    end
    
    def disconnect
      
    end
    
    protected
      def find_current_user
        # ActionCable doesn't work with sessions but only with cookies'
        if current_chef = Chef.find_by(id: cookies.signed[:chef_id])
          # Return current chef
          current_chef
        else
          reject_unauthorized_connection
        end
      end
  end
end
