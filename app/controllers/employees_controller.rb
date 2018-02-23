class EmployeesController < ApplicationController
  def index
    @employees = User.staff

  end
end
