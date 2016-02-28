class ApplicationController < ActionController::Base
  layout :layout_by_resource

  protect_from_forgery with: :exception
  before_filter :set_return_path

  private
    def after_sign_in_path_for(resource) 
      session["user_return_to"] || root_url 
    end

    def set_return_path
      unless devise_controller? || request.xhr? || !request.get?
        session["user_return_to"] = request.url
      end
    end

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end
end
