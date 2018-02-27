class ClockInsController < ApplicationController
    def new
        @clock_in = ClockIn.new
    end
    
    def create 
        @clock_in = ClockIn.new 
        @clock_in.user_id = params[:user_id]
        @clock_in.team_leader_id = current_user.id
        @clock_in.save
        redirect_to timesheets_index_path
    end
end
