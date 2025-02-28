module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = cookies.signed[:current_user_id]
    end
  end
end
