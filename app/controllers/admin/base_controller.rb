module Admin
  # Base controller for all admin namespaced controllers to inherit from
  class BaseController < ::ApplicationController
    layout 'admin'
  end
end
