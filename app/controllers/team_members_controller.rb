class TeamMembersController < ApplicationController
    before_action :set_department
    before_action :set_team
    
    def index 
    end
    def edit 
    end
    def new 
    end
    def create
        redirect_to new_department_team_team_leader_path(@department.id , @team.id)
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
