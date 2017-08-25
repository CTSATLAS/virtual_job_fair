module Admin
  class DashboardController < BaseController
    authorize_resource class: false

    def index; end
  end
end
