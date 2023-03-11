module SessionsHelper
    def logged_in?
        !!cookies[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(cookies[:user_id])
    end
end
