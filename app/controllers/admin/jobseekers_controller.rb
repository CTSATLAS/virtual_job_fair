module Admin
  class JobseekersController < BaseController
    def index
      @jobseekers = User.all_jobseekers
    end
  end
end
