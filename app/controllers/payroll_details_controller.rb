class PayrollDetailsController < ApplicationController
    before_action :set_user
    def index
    end
    
    def new
      @payroll_detail = PayrollDetail.new
    end
    
    def create
        @payroll_detail = PayrollDetail.new(payroll_detail_params)
        @payroll_detail.user_id = params[:user_id]
        if @payroll_detail.valid?
            @payroll_detail.save
            flash[:notice] = "PayRoll Information was saved "
            redirect_to employees_path
            
        else
            flash[:danger] = "Please fix thig error #{@payroll_detail.errors.full_messages}"
            redirect_to new_user_payroll_detail_path(@user.id)
        end
        
    end
    
    def edit
    end
    
    def update
    end
    
    private
    
    def payroll_detail_params
          params.require(:payroll_detail).permit(:employees_work_week_start , :work_week_hours , :basis_wages_paid , :regular_hourly_payrate ,:daily_or_weekly_straight_time, :user_id)
    end
    def set_user 
        @user = User.find_by_id(params[:user_id])
    end
end
