class ClockOutsController < ApplicationController
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
		            flash[:notice] = "the ${clock_out.user.name}"
		            redirect_to timesheets_index_path

		        else
		            flash[:notice] = "Th ${clock_out.user.name} has been signed in before"
		            redirect_to timesheets_index_path
		        end
            
             else
             	clock_in_user = ClockIn.create(user_id: user_id , time_clocked_in: Time.now)
             	redirect_to timesheets_index_path
             end
        
        end
end
