class ClockInsController < ApplicationController

    def new
        @clock_in = ClockIn.new
    end
    
    def create 
        check_clocked_in_status(params[:user_id])
         
        # remember to make into function
       
        

       
    end
    private 

        def check_clocked_in_status(user_id)
            
             clocked_in_status = ClockIn.where(user_id: user_id , time_clocked_in: Date.today.beginning_of_day..Date.today.end_of_day)
        if clocked_in_status.blank?
             clock_in = ClockIn.new
             clock_in.user_id = user_id
            clock_in.team_leader_id = current_user.id
            clock_in.time_clocked_in = Time.now
             clock_in.save
            flash[:notice] = "the ${clock_in.user.name}"
            redirect_to timesheets_index_path

        else
            flash[:notice] = "Th ${@clock_in.user.name} has been signed in before"
            redirect_to timesheets_index_path
        end
            
        end
end
