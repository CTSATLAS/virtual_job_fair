module Admin
  class MasqueradesController < Devise::MasqueradesController
    protected

    def after_back_masquerade_path_for(resource)
      admin_root_path
    end
  end
end
