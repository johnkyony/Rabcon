class TeamLeadersController < ApplicationController
    before_action :set_team
    def index 
      @team_leader = TeamLeader.new
      @team_leader.team_id = params[:team_id]
      @team_leader.team_member_id = params[:team_member_id]
      if @team_leader.valid?
        @team_leader.save
        flash[:notice] = "Changes have been saved , you  can choose more , click proceed"
        redirect_to new_department_team_team_leader_path(@team_leader.team.department_id , @team.id)
      else
       flash[:success] = "#{@team_member.errors.full_messages} please fix this error and try again"
        redirect_to new_department_team_team_leader_path(@team_leader.team.department_id , @team.id)

       
 
      end

    end
    def edit 
    end
    def new 
        staff_already_team_leader = TeamLeader.where(team_id: @team.id).pluck(:user_id)
     @employees = User.staff.where.not(id: staff_already_team_leader)
     
    end
    def create
    end
    
    def update
    end 
    
    private 
    
       
    def set_team 
        @team = Team.find_by_id(params[:team_id])
    end
end
