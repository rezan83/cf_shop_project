class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
        exception.default_message = "Not authorized to edit other users"
        redirect_to main_app.root_url, alert: exception.message
    end
end
