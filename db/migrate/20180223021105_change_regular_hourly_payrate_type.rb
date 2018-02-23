class ChangeRegularHourlyPayrateType < ActiveRecord::Migration
  def self.up
    change_column :payroll_details, :regular_hourly_payrate, :float
  end
 
  def self.down
    change_column :payroll_details, :regular_hourly_payrate, :time
  end
end
