module HomeHelper
    def user_activated?
        User.find_by_id(cookies[:user_id]).activated? ? true : false
    end
end
