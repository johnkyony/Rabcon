class ClockOutsController < ApplicationController
     skip_before_action :verify_authenticity_token
    respond_to :html , :json
	def new
        @clock_out = ClockOut.new
    end
    
    def create 
        check_clocked_out_status(params[:user_id])

    end


     private 

        def check_clocked_out_status(user_id)
            
             clocked_out_status = ClockOut.where(user_id: user_id , time_clocked_out: Date.today.beginning_of_day..Date.today.end_of_day)
             check_clocked_in_status = ClockIn.where(user_id: user_id , time_clocked_in: Date.today.beginning_of_day..Date.today.end_of_day )
             if !check_clocked_in_status.blank?
             	if clocked_out_status.blank?
		             clock_out = ClockOut.new
		             clock_out.user_id = user_id
		            clock_out.team_leader_id = current_user.id
		            clock_out.time_clocked_out = Time.now
		             clock_out.save
		            
                   daily_payment_clock_out(clock_out.id , clock_out.user_id)
                   else
                    render json: {status: 'SUCCESS', message: 'The  has been clocked in before today'}, status: :ok
                      
		        end
            
             else
             	clock_in_user = ClockIn.create(user_id: user_id , time_clocked_in: Time.now)
             	render json: {status: 'SUCCESS', message: 'The  has been clocked in before today'}, status: :ok
             end
        end
        
        def daily_payment_clock_out(clockout_id , user_id)
            daily_payment = DailyPayment.find_by(user_id: user_id , date_of_working_day: Date.today )
            if  ! daily_payment.blank?
               
                daily_payment.update(clock_out_id: clockout_id)
                calculate_hours(daily_payment.id ,user_id)
                
                
            end
        end
        
        def calculate_hours(payment , user_id)
            daily_payment = DailyPayment.find_by(id: payment , user_id: user_id)
            total_amount_of_hours_worked = time_difference(daily_payment.clock_in.time_clocked_in, daily_payment.clock_out.time_clocked_out) / 3600
            staff_payroll_straight_time = PayrollDetail.find_by_user_id(user_id)
            if  staff_payroll_straight_time.daily_or_weekly_straight_time >= total_amount_of_hour_worked
                daily_payment.update_attributes(regular_hours: total_amount_of_hour_worked , overtime_hours: 0)
            else
                overtime_hours = total_amount_of_hour_worked - staff_payroll_straight_time.daily_or_weekly_straight_time
                daily_payment.update_attributes(regular_hours: staff_payroll_straight_time.daily_or_weekly_straight_time , overtime_hours: overtime_hours)
            end
        end
        
        def time_difference(time_a , time_b)
            difference = time_b - time_a
            
            if difference > 0
                difference
            else
                24 * 3600 + difference
            end
        end
        
end
