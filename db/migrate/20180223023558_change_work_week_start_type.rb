class ChangeWorkWeekStartType < ActiveRecord::Migration
  def self.up
    change_column :payroll_details, :employees_work_week_start, :string
  end
 
  def self.down
    change_column :payroll_details, :employees_work_week_start, :datetime
  end
end
