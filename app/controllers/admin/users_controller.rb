module Admin
  class UsersController < BaseController
    load_and_authorize_resource

    def index
      @admins = User.all_administrators
    end

    def create
      admin = User.new(user_params)

      if admin.save
        admin.add_role :admin
        redirect_to admin_users_path
      else
        render :new
      end
    end

    def update
      user = User.find(params[:id])

      if user.update_attributes(user_params)
        redirect_to admin_users_path
      end
    end

    def destroy
      admin = User.find(params[:id])
      admin.destroy

      redirect_to admin_users_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end
  end
end
