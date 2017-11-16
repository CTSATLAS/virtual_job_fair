class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :masquerade_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, notice: exception.message }
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.has_role? :admin
      admin_root_path
    else
      dashboard_path
    end
  end
end
