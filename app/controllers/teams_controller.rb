class TeamsController < ApplicationController
    before_action :set_department
    def index
     @department_teams = Team.where(department_id: @department.id)
    end
    
    def edit 
    end
    
    
    def new
     @team = Team.new
    end
    
      def create
        @team = Team.new(team_params)
         @team.department_id = @department.id
         if @team.valid?
           @team.save
           flash[:notice] = "The team #{@team.name} has been created"
	   redirect_to new_department_team_team_member_path(@department.id , @team.id)
         else
          flash[:success] = "Please fix this error #{@team.errors.full_messages} "
          redirect_to  new_department_team_path(@department.id) 
         end
      end
      
    def update
    end
    
    def show
     @employees = TeamMember.where(team_id: params[:id])
     if ! @employees.blank?
       team_leader = TeamLeader.find_by_team_id( params[:id])
       if ! team_leader.blank?
           @team_leader_staff_status = User.find_by_id(team_leader.team_member_id).staff?
           @team_leader_details = StaffDetail.where(user_id: team_leader.team_member_id).first
       end
     end
     

    end
    
    private
    
    def team_params
      params.require(:team).permit(:name , :department_id, :description)
    end
    def set_department
        @department = Department.find_by_id(params[:department_id])
    end
     
end
