class ClockInsController < ApplicationController
     skip_before_action :verify_authenticity_token
    respond_to :html , :json 

    def new
        @clock_in = ClockIn.new
    end
    
   
    
    def create 
        check_clocked_in_status(params[:user_id])
        
        
        # remember to make into function
      
    end
    
    private 

        def check_clocked_in_status(user_id )
            
            clocked_in_status = ClockIn.where(user_id: user_id , time_clocked_in: Date.today.beginning_of_day..Date.today.end_of_day)
            staff_name = StaffDetail.find_by_user_id(user_id)
            if clocked_in_status.blank?
                 clock_in = ClockIn.new
                 clock_in.user_id = user_id
                clock_in.team_leader_id = current_user.id
                clock_in.time_clocked_in = Time.now
                 clock_in.save
                
               render json: {status: 'SUCCESS', message: 'The ${staff_name.employee_full_name} has been clocked in', data: staff_name.employee_full_name}, status: :ok
               daily_payment_clock_in(clock_in.id , user_id)
           else
            render json: {status: 'SUCCESS', message: 'The ${staff_name.employee_full_name} has been clocked in before today', data: staff_name.employee_full_name}, status: :ok
              
           end 
       end
        
    def daily_payment_clock_in(clock_in , user_id)
      daily_payment_checker = DailyPayment.where(date_of_working_day: Date.today)
      if daily_payment_checker.blank?
          clock_in_stamp =  DailyPayment.create(user_id: user_id , clock_in_id: clock_in , date_of_working_day: Date.today)
          clock_in_stamp.save
      end
      
        
    end
end
