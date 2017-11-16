module Admin
  # Base controller for all admin namespaced controllers to inherit from
  class BaseController < ::ApplicationController
    before_action :authenticate_user!
    check_authorization
    layout 'admin'
  end
end
