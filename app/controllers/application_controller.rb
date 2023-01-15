class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def layout_by_resource
    "authentication" if devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[username]
  end

  def user_not_authorized
    flash[:alert] = "Você não está autorizado a executar esta ação."
    redirect_to(request.referrer || root_path)
  end
end
