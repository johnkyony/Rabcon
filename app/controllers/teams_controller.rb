class TeamsController < ApplicationController
    def index
    end
    
    def edit 
    end
    
    
    def new
    end
    
      def create
          redirect_to new_department_team_team_member(@department.id , @team.id)
      end
      
    def update
    end
    
    private
    def set_department
        @department = Department.find_by_id(params[:department_id])
    end
     
end
