class DepartmentsController < ApplicationController
    def index
        @departments = Deparment.all
        if @departments.blank?
            flash[:notice] = "Please create at least one department"
            redirect_to new_department_path
        end
    end
    
    def new
        @department = Department.new
    end
    
    def create
        @department = Department.new(department_params)
        
        if @department.valid? 
            @department.save 
            flash[:notice] = "Create a team"
            redirect_to new_department_team_path(@department.id)
        else
            flash[:danger] = "#{@department.errors.full_messages}"
            redirect_to new_department_path
        end
        
         
    end
    
    def update
        
    end
    
    def edit
    end
   
   private
   def set_department
       @department = Department.find_by_id(params[:id])
   end
   def department_params
     params.require(:department).permit(:name , :description)
   end
   
end
