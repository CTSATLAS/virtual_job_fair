module Admin
  class EmployersController < BaseController
    load_and_authorize_resource class: :user

    def index
      @employers = User.all_employers
    end
  end
end
