class ChangeWorkWeekHoursType < ActiveRecord::Migration
  def self.up
    change_column :payroll_details, :work_week_hours, :integer
    change_column :payroll_details, :daily_or_weekly_straight_time, :integer
  end
 
  def self.down
   change_column :payroll_details, :work_week_hours, :time
   change_column :payroll_details, :daily_or_weekly_straight_time, :time
  end
end
