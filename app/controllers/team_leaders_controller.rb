class TeamLeadersController < ApplicationController
    def index 
    end
    def edit 
    end
    def new 
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
