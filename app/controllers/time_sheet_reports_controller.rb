class TimeSheetReportsController < ApplicationController
  def index
  	@current_month_department_payroll_information = Hash.new
  	@current_month_team_payroll_information = Hash.new
  	
  end
end
