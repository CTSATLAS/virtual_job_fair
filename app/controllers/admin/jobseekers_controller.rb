module Admin
  class JobseekersController < BaseController
    load_and_authorize_resource class: :user

    def index
      @jobseekers = User.all_jobseekers
    end
  end
end
