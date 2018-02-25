class StaffDetailsController < ApplicationController
    before_action :set_user
    before_action :check_staff_detail_uniqueness , except: [:index]
    
    def index
        @user_details = User.find_by_id(params[:user_id])
        @staff_details = StaffDetail.find_by_user_id(params[:user_id])
        @payroll_details = PayrollDetail.find_by_user_id(params[:user_id])
        if @staff_details.blank?
            redirect_to new_user_staff_detail_path(params[:user_id])
        end
        
        if @payroll_details.blank?
            redirect_to new_user_payroll_detail_path(params[:user_id])
        end
        # @member_of_team = TeamMember.where(user_id: params[:user_id])
    end
    
    def new
      @staff_detail = StaffDetail.new
    end
    def create
        @staff_detail = StaffDetail.new(staff_details_params)
        @staff_detail.user_id = params[:user_id]
        
        @staff_detail.employee_number = Random.new_seed 
        
        if @staff_detail.valid?
            @staff_detail.save
            redirect_to  new_user_payroll_detail_path(@user.id)
        else
           flash[:notice] = "Please fix this error #{@staff_detail.errors.full_messages} then try again" 
           redirect_to  new_user_staff_detail_path(@user.id)
        end
        
    end
    def update
    end
    private
    def staff_details_params
        params.require(:staff_detail).permit(:employee_full_name , :address , :birthdate , :id_or_passport_number , :user_id)
    end
    
    def check_staff_detail_uniqueness
        staff_detail = StaffDetail.find_by_user_id(params[:user_id])
        
        if ! staff_detail.blank?
           flash[:notice] = "The user details are already in the system"
           redirect_to employees_path
        end
        
    end
    def set_user
        @user = User.find_by_id(params[:user_id])
    end
    
end
