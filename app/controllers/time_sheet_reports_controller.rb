class TimeSheetReportsController < ApplicationController
  def index
    @timesheet_report = Hash.new
  	clock_in = ClockIn.where('time_clocked_in >=  ? AND time_clocked_in <= ? ' , DateTime.now.beginning_of_month  , DateTime.now.end_of_month)
  	clock_out = ClockOut.where('time_clocked_out >= ? AND time_clocked_out <= ?' , DateTime.now.beginning_of_month , DateTime.now.end_of_month)
  	@staff = StaffDetail.find_by_user_id(params[:user_id])
  	@timesheet_report["#{@staff.employee_full_name}"] = { :time_clocked_in => clock_in.where(user_id: @staff.user_id).pluck(:time_clocked_in) , :time_clocked_out =>  clock_out.where(user_id: @staff.user_id).pluck(:time_clocked_out) }
  end
end
