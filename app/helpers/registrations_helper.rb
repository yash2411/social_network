module RegistrationsHelper
    def current_user
        current_user = User.find_by_id(id: cookies[:id])
    end
end
