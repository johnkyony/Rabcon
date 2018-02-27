class TeamMembersController < ApplicationController
    before_action :set_department
    before_action :set_team
    
    def index 
     @team_member = TeamMember.new
      @team_member.team_id = params[:team_id]
      @team_member.user_id = params[:user_id]
      if @team_member.valid?
        @team_member.save
        flash[:notice] = "#{@team_member.user.name} has been added , you can choose more , click done to proceed"
        redirect_to new_department_team_team_member_path(@department.id , @team.id)
      else
       flash[:success] = "#{@team_member.errors.full_messages} please fix this error and try again"
        redirect_to new_department_team_team_member_path(@department.id , @team.id)
 
      end

    end
    def edit 
    end
    def new 
     staff_already_in_team = TeamMember.where(team_id: @team.id).pluck(:user_id)
     @employees = User.staff.where.not(id: staff_already_in_team)
     
    end
    def create
    end
    
    def update
    end 
    
    private 
    
    def set_department
        @department = Department.find_by_id(params[:department_id])
    
    end
    
    def set_team 
        @team = Team.find_by_id(params[:team_id])
    end
end
