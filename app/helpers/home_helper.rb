module HomeHelper
    def logged_in
        @current_user = User.find_by_id(cookies[:user_id])
    end
end
