class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :surname, :location, :ywam_base, :bio, :admin])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :surname, :location, :ywam_base, :bio, :admin])
    end
end
