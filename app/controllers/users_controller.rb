class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_admin_checker
  
  # after_action :verify_authorized

  def index
    @users = User.all
    # authorize User
  end

  def show
    @user = User.find(params[:id])
    # authorize @user
  end

  def update
    @user = User.find(params[:id])
    # authorize @user
    if @user.update_attributes(secure_params)
      if @user.staff?
        redirect_to new_user_staff_detail_path(@user.id), :notice => "User updated. Please may you fill in staff details"
      else
        redirect_to employees_path
      end
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    # authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end
  
  def current_user_admin_checker
    if ! current_user.admin?
      flash[:danger] = "Your not authorized to access this section"
      redirect_to :back
    end
    
  end

end
