class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :email_confirmation, :mobile_number, :mobile_number_confirmation, :password, :password_confirmation) }
    end

    def check_rank
        if current_user.rank_id < 1
            redirect_to root_path
            return false
        else
            return true
        end
    end

end
