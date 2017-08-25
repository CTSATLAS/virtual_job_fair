module Admin
  # Base controller for all admin namespaced controllers to inherit from
  class BaseController < ::ApplicationController
    before_action :authenticate_user!

    layout 'admin'
  end
end
